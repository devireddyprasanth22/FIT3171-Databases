--*****PLEASE ENTER YOUR DETAILS BELOW*****
--T1-mns-schema.sql

--Student ID: 31332374
--Student Name: Devireddy Prasanth
--Unit Code:FIT3171
--Applied Class No:6

/* Comments for your marker:




*/

-- Task 1 Add Create table statements for the white TABLES below
-- Ensure all column comments, and constraints (other than FK's)
-- are included. FK constraints are to be added at the end of this script

-- TABLE: APPOINTMENT
CREATE TABLE appointment (
    appt_no           NUMBER(7) NOT NULL,
    appt_datetime     DATE NOT NULL,
    appt_roomno       NUMBER(2) NOT NULL,
    appt_length       CHAR(1) NOT NULL,
    patient_no        NUMBER(4) NOT NULL,
    provider_code     CHAR(6) NOT NULL,
    nurse_no          NUMBER(3) NOT NULL,
    appt_prior_apptno NUMBER(7)
);
ALTER TABLE appointment ADD CONSTRAINT appointment_pk PRIMARY KEY ( appt_no );
ALTER TABLE appointment
    ADD CONSTRAINT apptlength_chk CHECK ( appt_length IN ( 'S', 'T', 'L')
    );
-- TABLE: EMERGENCY_CONTACT
CREATE TABLE emergency_contact (
    ec_id    NUMBER(4) NOT NULL,
    ec_fname VARCHAR(30),
    ec_lname VARCHAR(30),
    ec_phone CHAR(10) NOT NULL
);
ALTER TABLE emergency_contact ADD CONSTRAINT ec_pk PRIMARY KEY ( ec_id );
-- TABLE: PATIENT
CREATE TABLE patient (
    patient_no             NUMBER(4) NOT NULL,
    patient_fname          VARCHAR(30),
    patient_lname          VARCHAR(30),
    patient_street         VARCHAR(50) NOT NULL,
    patient_city           VARCHAR(20) NOT NULL,
    patient_state          VARCHAR(3) NOT NULL,
    patient_postcode       CHAR(4) NOT NULL,
    patient_dob            DATE NOT NULL,
    patient_contactmobile  CHAR(10) NOT NULL,
    patient_contactemail   VARCHAR(25) NOT NULL,
    ec_id                  NUMBER(4) NOT NULL
);
ALTER TABLE patient ADD CONSTRAINT patient_pk PRIMARY KEY ( patient_no );
ALTER TABLE patient
    ADD CONSTRAINT patientstate_chk CHECK ( patient_state IN ( 'NT', 'QLD', 'NSW', 'ACT', 'VIC', 'TAS', 'SA', 'WA')
    );
-- Add all missing FK Constraints below here
ALTER TABLE patient
    ADD CONSTRAINT ec_fk FOREIGN KEY ( ed_id )
        REFERENCES emergency_contact ( ec_id );
        
ALTER TABLE emergency_contact
    ADD CONSTRAINT ec_uq UNIQUE ( ec_phone);
    
ALTER TABLE appointment
    ADD CONSTRAINT appointment_uq UNIQUE ( appt_datetime,
                                          appt_roomno,
                                          patient_no,
                                          provider_code,
                                          appt_prior_apptno);
ALTER TABLE appointment
    ADD CONSTRAINT patient_appointment_fk FOREIGN KEY ( patient_no )
        REFERENCES patient ( patient_no );

ALTER TABLE appointment
    ADD CONSTRAINT provider_appointment_fk FOREIGN KEY ( provider_code )
        REFERENCES provider ( provider_code );
        
ALTER TABLE appointment
    ADD CONSTRAINT appointment_fk FOREIGN KEY ( appt_prior_apptno )
        REFERENCES appointment ( appt_prior_apptno );
