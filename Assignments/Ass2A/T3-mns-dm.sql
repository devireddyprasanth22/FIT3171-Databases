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
    ec_id_seq.NEXTVAL,
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

--3(d)
UPDATE appointment
SET appt_datetime = TO_DATE('18/09/2023 16:00', 'dd/mm/yyyy hh24:mi')
WHERE appt_no =  appt_no_seq.currval;

--3(e)

