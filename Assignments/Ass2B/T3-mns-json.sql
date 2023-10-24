--*****PLEASE ENTER YOUR DETAILS BELOW*****
--T3-mns-json.sql

--Student ID:
--Student Name:
--Unit Code:
--Applied Class No:

/* Comments for your marker:




*/

/*3(a)*/
-- PLEASE PLACE REQUIRED SQL SELECT STATEMENT TO GENERATE 
-- THE COLLECTION OF JSON DOCUMENTS HERE
-- ENSURE that your query is formatted and has a semicolon
-- (;) at the end of this answer APPOINTMENT, PROVIDER, ITEM, APPT_SERV, APPTSERVICE_ITEM
set pagesize 300

SELECT
        JSON_OBJECT(
            '_id' VALUE appt_no,
                    'datetime' VALUE appt_datetime,
                    'provider_code' VALUE provider_code,
                    'provider_name' VALUE provider_title || '. ' || provider_fname || ' ' || provider_lname,
                    'item_totalcost' VALUE SUM(item_stdcost * as_item_quantity),
                    'no_of_items' VALUE count(as_item_quantity),
                    'items' VALUE JSON_ARRAYAGG(
                JSON_OBJECT(
                    'id' VALUE item_id,
                    'desc' VALUE item_desc,
                    'standardcost' VALUE item_stdcost,
                    'quantity' VALUE as_item_quantity
                )
            ORDER BY
                item_id
            )
        FORMAT JSON)
        || ','
FROM
         mns.appointment
    NATURAL JOIN mns.provider
    NATURAL JOIN mns.item
    NATURAL JOIN mns.appt_serv
    NATURAL JOIN mns.apptservice_item
GROUP BY
    appt_no,
    appt_datetime,
    provider_code,
    provider_title || '. ' || provider_fname || ' ' || provider_lname
ORDER BY
    appt_no;