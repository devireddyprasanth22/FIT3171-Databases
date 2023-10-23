--*****PLEASE ENTER YOUR DETAILS BELOW*****
--T2-mns-select.sql

--Student ID:
--Student Name:
--Unit Code:
--Applied Class No:

/* Comments for your marker:




*/

/*2(a)*/
-- PLEASE PLACE REQUIRED SQL SELECT STATEMENT FOR THIS PART HERE
-- ENSURE that your query is formatted and has a semicolon
-- (;) at the end of this answer
SELECT item_id, item_desc, item_stdcost, item_stock
FROM mns.item
WHERE item_stock >= 50
  AND LOWER(item_desc) LIKE '%composite%'
ORDER BY item_stock DESC, item_id;



/*2(b)*/
-- PLEASE PLACE REQUIRED SQL SELECT STATEMENT FOR THIS PART HERE
-- ENSURE that your query is formatted and has a semicolon
-- (;) at the end of this answer
SELECT provider_title || '. ' || provider_fname || ' '|| provider_lname
FROM mns.provider
NATURAL JOIN mns.specialisation
WHERE UPPER(mns.specialisation.spec_name) = 'PAEDIATRIC DENTISTRY'
ORDER BY provider_lname, provider_fname, provider_code;

/*2(c)*/
-- PLEASE PLACE REQUIRED SQL SELECT STATEMENT FOR THIS PART HERE
-- ENSURE that your query is formatted and has a semicolon
-- (;) at the end of this answer
SELECT service_code, service_desc, LPAD(TO_CHAR(service_stdfee, '$9999.99'), 15) as service_stdfee
FROM mns.service
WHERE service_stdfee > (SELECT AVG(service_stdfee) FROM mns.service)
ORDER BY service_stdfee DESC, service_code;


/*2(d)*/
-- PLEASE PLACE REQUIRED SQL SELECT STATEMENT FOR THIS PART HERE
-- ENSURE that your query is formatted and has a semicolon
-- (;) at the end of this answer
SELECT appt_no, appt_datetime, patient_no, patient_fname, LPAD(TO_CHAR(apptserv_fee + COALESCE(apptserv_itemcost, 0),'$9999.99'), 15) as total
FROM mns.appointment
NATURAL JOIN mns.patient
NATURAL JOIN mns.appt_serv 
ORDER BY total DESC, appt_no;

/*2(e)*/
-- PLEASE PLACE REQUIRED SQL SELECT STATEMENT FOR THIS PART HERE
-- ENSURE that your query is formatted and has a semicolon
-- (;) at the end of this answer
SELECT service_code, service_desc, TO_CHAR(service_stdfee, '$9999.99') AS standard_fee,TO_CHAR(AVG(apptserv_fee) - service_stdfee, '$9999.99') AS service_fee_differential
FROM mns.service
NATURAL JOIN mns.appt_serv
GROUP BY service_code, service_desc, service_stdfee
ORDER BY service_code;


/*2(f)*/
-- PLEASE PLACE REQUIRED SQL SELECT STATEMENT FOR THIS PART HERE
-- ENSURE that your query is formatted and has a semicolon
-- (;) at the end of this answer



/*2(g)*/
-- PLEASE PLACE REQUIRED SQL SELECT STATEMENT FOR THIS PART HERE
-- ENSURE that your query is formatted and has a semicolon
-- (;) at the end of this answer
