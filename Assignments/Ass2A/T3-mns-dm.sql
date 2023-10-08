--*****PLEASE ENTER YOUR DETAILS BELOW*****
--T3-mns-dm.sql

--Student ID:
--Student Name:
--Unit Code:
--Applied Class No:

/* Comments for your marker:




*/


--3(a)
-- Drop and recreate the EMERGENCY CONTACT sequence
DROP SEQUENCE ec_id_seq;
CREATE SEQUENCE ec_id_seq
  START WITH 100
  INCREMENT BY 5;

-- Drop and recreate the PATIENT sequence
DROP SEQUENCE patient_no_seq;
CREATE SEQUENCE patient_no_seq
  START WITH 100
  INCREMENT BY 5;
-- Drop and recreate the APPOINTMENT sequence
DROP SEQUENCE appt_no_seq;
CREATE SEQUENCE appt_no_seq
  START WITH 100
  INCREMENT BY 5;


--3(b)
--insert emergency contact Jonathan
INSERT INTO emergency_contact VALUES (
    ec_id_seq.nextval,
    'Jonathan',
    'Robey',
    '0412523122'
);
--insert patient Laura
INSERT INTO patient VALUES (
    patient_no_seq.nextval,
    'Laura',
    'Lachlan',
    '60 Argyle street',
    'Melbourne',
    'VIC',
    '3780',
    TO_DATE('10/08/2010', 'dd/mm/yyyy'),
    '0412523122',
    'laura@gmail.com',
    ec_id_seq.currval
);
--insert appointment for laura
INSERT INTO appointment VALUES (
    appt_no_seq.nextval,
    TO_DATE('4/9/2023 15:30', 'dd/mm/yyyy hh24:mi'),
    5,
    'S',
    patient_no_seq.currval,
    'GEN001',
    6,
    NULL
);
--insert patient Lachlan
INSERT INTO patient VALUES (
    patient_no_seq.nextval,
    'Lachlan',
    'Lachlan',
    '60 Argyle street',
    'Melbourne',
    'VIC',
    '3780',
    TO_DATE('10/08/2010', 'dd/mm/yyyy'),
    '0412523122',
    'laura@gmail.com',
    ec_id_seq.currval
);
--insert appointment for lachlan
INSERT INTO appointment VALUES (
    appt_no_seq.nextval,
    TO_DATE('4/9/2023 16:00', 'dd/mm/yyyy hh24:mi'),
    5,
    'S',
    patient_no_seq.currval,
    'GEN001',
    6,
    NULL
);


--3(c)
--follow up for lachlan
INSERT INTO appointment VALUES (
    appt_no_seq.nextval,
    TO_DATE('14/9/2023 16:00', 'dd/mm/yyyy hh24:mi'),
    5,
    'L',
    patient_no_seq.currval,
    'GEN001',
    14,
    appt_no_seq.currval
);

-- To get the appointment number
SELECT
    "A1"."APPT_NO" "APPT_NO"
FROM
    "PDEV0010"."APPOINTMENT" "A1"
WHERE
        "A1"."PATIENT_NO" = (
            SELECT
                "A2"."PATIENT_NO" "PATIENT_NO"
            FROM
                "PDEV0010"."PATIENT" "A2"
            WHERE
                "A2"."PATIENT_FNAME" = 'Lachlan'
        )
    AND "A1"."APPT_DATETIME" = TO_DATE('14/9/2023 16:00', 'dd/mm/yyyy hh24:mi');
--3(d)
UPDATE appointment
SET appt_datetime = TO_DATE('18/09/2023 16:00', 'dd/mm/yyyy hh24:mi')
WHERE appt_no =  110;

--3(e)
DELETE FROM appointment
WHERE provider_code = 'GEN001'
  AND appt_datetime >= TO_DATE('15/09/2023', 'dd/mm/yyyy')
  AND appt_datetime <= TO_DATE('22/09/2023', 'dd/mm/yyyy');

commit;
