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
SELECT
    item_id,
    item_desc,
    item_stdcost,
    item_stock
FROM
    mns.item
WHERE
        item_stock >= 50
    AND lower(item_desc) LIKE '%composite%'
ORDER BY
    item_stock DESC,
    item_id;



/*2(b)*/
-- PLEASE PLACE REQUIRED SQL SELECT STATEMENT FOR THIS PART HERE
-- ENSURE that your query is formatted and has a semicolon
-- (;) at the end of this answer
SELECT
    provider_title
    || '. '
    || provider_fname
    || ' '
    || provider_lname
FROM
         mns.provider
    NATURAL JOIN mns.specialisation
WHERE
    upper(mns.specialisation.spec_name) = 'PAEDIATRIC DENTISTRY'
ORDER BY
    provider_lname,
    provider_fname,
    provider_code;

/*2(c)*/
-- PLEASE PLACE REQUIRED SQL SELECT STATEMENT FOR THIS PART HERE
-- ENSURE that your query is formatted and has a semicolon
-- (;) at the end of this answer
SELECT
    service_code,
    service_desc,
    lpad(to_char(service_stdfee, '$9999.99'),
         15) AS service_stdfee
FROM
    mns.service
WHERE
    service_stdfee > (
        SELECT
            AVG(service_stdfee)
        FROM
            mns.service
    )
ORDER BY
    service_stdfee DESC,
    service_code;


/*2(d)*/
-- PLEASE PLACE REQUIRED SQL SELECT STATEMENT FOR THIS PART HERE
-- ENSURE that your query is formatted and has a semicolon
-- (;) at the end of this answer
SELECT
    appt_no,
    appt_datetime,
    patient_no,
    patient_fname,
    lpad(to_char(apptserv_fee + coalesce(apptserv_itemcost, 0),
                 '$9999.99'),
         15) AS total
FROM
         mns.appointment
    NATURAL JOIN mns.patient
    NATURAL JOIN mns.appt_serv
ORDER BY
    total DESC,
    appt_no;

/*2(e)*/
-- PLEASE PLACE REQUIRED SQL SELECT STATEMENT FOR THIS PART HERE
-- ENSURE that your query is formatted and has a semicolon
-- (;) at the end of this answer
SELECT
    service_code,
    service_desc,
    to_char(service_stdfee, '$9999.99') AS standard_fee,
    to_char(AVG(apptserv_fee) - service_stdfee,
            '$9999.99')                 AS service_fee_differential
FROM
         mns.service
    NATURAL JOIN mns.appt_serv
GROUP BY
    service_code,
    service_desc,
    service_stdfee
ORDER BY
    service_code;


/*2(f)*/
-- PLEASE PLACE REQUIRED SQL SELECT STATEMENT FOR THIS PART HERE
-- ENSURE that your query is formatted and has a semicolon
-- (;) at the end of this answer
SELECT
    patient_no,
    patient_fname
    || ' '
    || patient_lname,
    round(months_between(sysdate, patient_dob) / 12) AS current_age,
    COUNT(appt_no)                                   AS numappts,
    to_char(
        CASE
            WHEN COUNT(appt_no) = 0 THEN
                0
            ELSE
                (COUNT(
                    CASE
                        WHEN appt_prior_apptno IS NOT NULL THEN
                            1
                    END
                ) / COUNT(appt_no) * 100)
        END,
        '990.99')
    || '%'                                           AS followups
FROM
    mns.patient 
    NATURAL JOIN mns.appointment
GROUP BY
    patient_no,
    patient_fname,
    patient_lname,
    patient_dob
ORDER BY
    patient_no;

/*2(g)*/
-- PLEASE PLACE REQUIRED SQL SELECT STATEMENT FOR THIS PART HERE
-- ENSURE that your query is formatted and has a semicolon
-- (;) at the end of this answer
SELECT
    provider_code           AS pcode,
    COUNT(DISTINCT appt_no) AS numberappt,
    CASE
        WHEN SUM(apptserv_fee) IS NULL THEN
            '-'
        ELSE
            to_char(SUM(apptserv_fee),
                    '$99999.99')
    END                     AS totalfees,
    CASE
        WHEN SUM(as_item_quantity) IS NULL THEN '-'
        ELSE TO_CHAR(SUM(as_item_quantity), '99999')
    END AS noitems
FROM
         mns.provider
    NATURAL JOIN mns.appointment
    NATURAL JOIN mns.appt_serv
    NATURAL JOIN mns.apptservice_item 
WHERE
    appt_datetime BETWEEN TO_DATE('10-Sep-2023 09:00', 'dd-Mon-yyyy hh24:mi') AND
    TO_DATE('14-Sep-2023 17:00', 'dd-Mon-yyyy hh24:mi')
GROUP BY
    provider_code
ORDER BY
    provider_code;