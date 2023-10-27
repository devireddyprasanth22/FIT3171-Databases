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
count_values_appt number;
count_values_sc number;
count_values_pc number;
BEGIN
-- finding if appt number is valid
    SELECT COUNT(*) INTO count_values_appt from appointment WHERE appt_no = p_appt_no;
--finding if service code is valid
    SELECT COUNT(*) INTO count_values_sc from service WHERE service_code = p_service_code;
-- finding valid provider
    SELECT COUNT(*) INTO count_values_pc from provider WHERE provider_code = (SELECT provider_code from appointment where appt_no = p_appt_no);
IF
    count_values_appt = 1
    AND count_values_sc = 1
THEN
    IF count_values_pc = 1 THEN
        INSERT INTO appt_serv VALUES(p_appt_no, p_service_code, NULL, NULL);
        p_output:='The new appointment service' || p_appt_no || ' ' || p_service_code || ' has been added';
   
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
 --call the procedure - error
 prc_insert_appt_serv(1,'P001',output);
 dbms_output.put_line(output);
END;
/

select * from appt_serv;

--4(b) 
--Write your trigger statement, 
--finish it with a slash(/) followed by a blank line

-- Write Test Harness for 4(b)
