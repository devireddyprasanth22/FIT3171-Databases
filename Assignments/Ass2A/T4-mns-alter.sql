--*****PLEASE ENTER YOUR DETAILS BELOW*****
--T4-mns-alter.sql

--Student ID:
--Student Name:
--Unit Code:
--Applied Class No:

/* Comments for your marker:




*/
--4(a)
--ading new attribute
ALTER TABLE patient
ADD total_appointments NUMBER(4) DEFAULT 0;

UPDATE patient p
SET p.total_appointments = (
    SELECT COUNT(a.appt_no)
    FROM appointment a
    WHERE a.patient_no = p.patient_no
);

DESC patient;
SELECT patient_no, patient_fname, patient_lname, total_appointments
FROM patient;
--4(b)
DROP TABLE patient_ec CASCADE CONSTRAINTS;
CREATE TABLE patient_ec (
    patient_no NUMBER(4) NOT NULL,
    ec_id NUMBER(4) NOT NULL
);
ALTER TABLE patient_ec ADD CONSTRAINT patient_ec_pk PRIMARY KEY ( patient_no,ec_id );
ALTER TABLE patient_ec ADD CONSTRAINT patient_patient_ec_fk FOREIGN KEY (patient_no) REFERENCES patient(patient_no);
ALTER TABLE patient_ec ADD CONSTRAINT ec_patient_ec_fk FOREIGN KEY (ec_id) REFERENCES emergency_contact(ec_id);

SELECT p.patient_no, p.patient_fname, p.patient_lname, ec.ec_fname, ec.ec_lname, ec.ec_phone
FROM patient p
JOIN patient_ec pec ON p.patient_no = pec.patient_no
JOIN emergency_contact ec ON pec.ec_id = ec.ec_id;

DESC patient_ec;

--4(c)
DROP TABLE nurse_training CASCADE CONSTRAINTS;
CREATE TABLE nurse_training (
    training_id        NUMBER(3) NOT NULL,
    nurse_no           NUMBER(3) NOT NULL,
    nurse_fname        VARCHAR2(30),
    nurse_lname        VARCHAR2(30),
    nurse_trainer_no   NUMBER(3) NOT NULL,
    nurse_trainer_fname VARCHAR2(30),
    nurse_trainer_lname VARCHAR2(30),
    start_datetime      DATE NOT NULL,
    end_datetime        DATE NOT NULL,
    descrip             VARCHAR(50)
    
);
--adding pk
ALTER TABLE nurse_training
ADD CONSTRAINT nurse_training_pk PRIMARY KEY (training_id);

--adding fks
ALTER TABLE nurse_training
ADD CONSTRAINT nurse_training_nurse_no_fk
FOREIGN KEY (nurse_no)
REFERENCES nurse(nurse_no);

ALTER TABLE nurse_training
ADD CONSTRAINT nurse_training_nurse_trainer_no_fk
FOREIGN KEY (nurse_trainer_no)
REFERENCES nurse(nurse_no);

ALTER TABLE nurse_training
ADD CONSTRAINT nurse_training_nurse_fname_fk
FOREIGN KEY (nurse_fname)
REFERENCES nurse(nurse_fname);

ALTER TABLE nurse_training
ADD CONSTRAINT nurse_training_nurse_lname_fk
FOREIGN KEY (nurse_lname)
REFERENCES nurse(nurse_lname);

ALTER TABLE nurse_training
ADD CONSTRAINT nurse_training_nurse_trainer_fname_fk
FOREIGN KEY (nurse_trainer_fname)
REFERENCES nurse(nurse_fname);

ALTER TABLE nurse_training
ADD CONSTRAINT nurse_training_nurse_trainer_lname_fk
FOREIGN KEY (nurse_trainer_lname)
REFERENCES nurse(nurse_lname);