--*****PLEASE ENTER YOUR DETAILS BELOW*****
--T4-mns-plsql.sql

--Student ID:
--Student Name:
--Unit Code:
--Applied Class No:

/* Comments for your marker:

*/

SET SERVEROUTPUT ON

--4(a) 
-- Complete the procedure below
CREATE OR REPLACE PROCEDURE prc_insert_appt_serv (
    p_appt_no      IN NUMBER,
    p_service_code IN CHAR,
    p_output       OUT VARCHAR2
) AS
    count_values_appt NUMBER;
    count_values_sc   NUMBER;
    count_values_pc   NUMBER;
    provider_id       VARCHAR2 (6);
BEGIN
-- finding if appt number is valid
    SELECT
        COUNT(*)
    INTO count_values_appt
    FROM
        appointment
    WHERE
        appt_no = p_appt_no;
--finding if service code is valid
    SELECT
        COUNT(*)
    INTO count_values_sc
    FROM
        service
    WHERE
        service_code = p_service_code;
-- finding valid provider
    IF
        count_values_appt = 1
        AND count_values_sc = 1
    THEN
        SELECT
        provider_code
    INTO provider_id
    FROM
        appointment
    WHERE
        p_appt_no = appt_no;
    
    SELECT COUNT(*)
    INTO count_values_pc
    FROM provider_service
    WHERE provider_code = provider_id and p_service_code = service_code;
    
    
        IF count_values_pc = 1 THEN
            INSERT INTO appt_serv VALUES (
                p_appt_no,
                p_service_code,
                NULL,
                NULL
            );
            p_output := 'The new appointment service'
                        || p_appt_no
                        || ' '
                        || p_service_code
                        || ' has been added';
        ELSE
            p_output := 'Provider not valid';
        END IF;
    ELSE
        p_output := 'appt no and service code not valid';
    END IF;

END;
/

-- Write Test Harness for 4(a)
DECLARE
 output VARCHAR2(200);
BEGIN
 prc_insert_appt_serv(1,'EX03',output);
 dbms_output.put_line(output);
END;
/

select * from PROVIDER_SERVICE;
rollback;

--4(b) 
--Write your trigger statement, 
--finish it with a slash(/) followed by a blank line
-- Create a trigger to update item_stock and apptserv_itemcost values.
CREATE OR REPLACE TRIGGER maintain_apptservice_itemcost_item_stock AFTER
    INSERT OR UPDATE OR DELETE ON apptservice_item
    FOR EACH ROW
BEGIN
    IF inserting THEN
        UPDATE item
        SET
            item_stock = item_stock - :new.as_item_quantity
        WHERE
            item_id = :new.item_id;

        UPDATE appt_serv
        SET
            apptserv_itemcost = :new.as_item_quantity * (
                SELECT
                    item_stdcost
                FROM
                    item
                WHERE
                    item_id = :new.item_id
            )
        WHERE
                appt_no = :new.appt_no
            AND service_code = :new.service_code;


    ELSIF updating THEN
        UPDATE item
        SET
            item_stock = item_stock + :old.as_item_quantity - :new.as_item_quantity
        WHERE
            item_id = :new.item_id;

        UPDATE appt_serv
        SET
            apptserv_itemcost = :new.as_item_quantity * (
                SELECT
                    item_stdcost
                FROM
                    item
                WHERE
                    item_id = :new.item_id
            )
        WHERE
                appt_no = :new.appt_no
            AND service_code = :new.service_code;


    ELSIF deleting THEN
        UPDATE item
        SET
            item_stock = item_stock + :old.as_item_quantity
        WHERE
            item_id = :old.item_id;

        UPDATE appt_serv
        SET
            apptserv_itemcost = null
        WHERE
                appt_no = :old.appt_no
            AND service_code = :old.service_code;

    END IF;

END;
/

select * from item;
select * from appt_serv;
select * from apptservice_item;

rollback;
-- Write Test Harness for 4(b)
INSERT INTO appt_serv values
(1,'X001', 1, 0);

INSERT INTO apptservice_item values
(1, 1, 'X001', 1, 10);

INSERT INTO appt_serv VALUES 
(3, 'EX01', 10, 5);

INSERT INTO apptservice_item values
(2, 3, 'EX01', 2, 1);

--UPDATING

UPDATE apptservice_item 
SET as_item_quantity = 40
where as_id = 1;

UPDATE apptservice_item 
SET as_item_quantity = 3
where as_id = 2;

--DELETING
DELETE FROM apptservice_item where as_id = 2;