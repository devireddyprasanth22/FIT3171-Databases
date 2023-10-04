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
COMMENT ON COLUMN appointment.appt_no IS
    'Appointment number (unique)';
COMMENT ON COLUMN appointment.appt_datetime IS
    'Date and time of the appointment';

COMMENT ON COLUMN appointment.appt_roomno IS
    'appointment room number';

COMMENT ON COLUMN appointment.appt_length IS
    'Length of the appointment';

COMMENT ON COLUMN appointment.patient_no IS
    'patient number';

COMMENT ON COLUMN appointment.provider_code IS
    'Provider code for the appointment';

COMMENT ON COLUMN appointment.nurse_no IS
    'nurse number';

COMMENT ON COLUMN appointment.appt_prior_apptno IS
    'Appointment number of the prior appointment';
    
-- TABLE: EMERGENCY_CONTACT
CREATE TABLE emergency_contact (
    ec_id    NUMBER(4) NOT NULL,
    ec_fname VARCHAR(30),
    ec_lname VARCHAR(30),
    ec_phone CHAR(10) NOT NULL
);
ALTER TABLE emergency_contact ADD CONSTRAINT ec_pk PRIMARY KEY ( ec_id );
COMMENT ON COLUMN emergency_contact.ec_id IS
    'emergency contact ID (unique)';

COMMENT ON COLUMN emergency_contact.ec_fname IS
    'First name of the emergency contact';

COMMENT ON COLUMN emergency_contact.ec_lname IS
    'Last name of the emergency contact';

COMMENT ON COLUMN emergency_contact.ec_phone IS
    'Phone number of the emergency contact';
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
COMMENT ON COLUMN patient.patient_no IS
    'patient number (unique)';

COMMENT ON COLUMN patient.patient_fname IS
    'First name of the patient';

COMMENT ON COLUMN patient.patient_lname IS
    'Last name of the patient';

COMMENT ON COLUMN patient.patient_street IS
    'Street address of the patient';

COMMENT ON COLUMN patient.patient_city IS
    'Residential city of the patient';

COMMENT ON COLUMN patient.patient_state IS
    'patient residential state';

COMMENT ON COLUMN patient.patient_postcode IS
    'Postal code of the patient';

COMMENT ON COLUMN patient.patient_dob IS
    'Date of birth of the patient';

COMMENT ON COLUMN patient.patient_contactmobile IS
    'Contact mobile number of the patient';

COMMENT ON COLUMN patient.patient_contactemail IS
    'Contact email address of the patient';

COMMENT ON COLUMN patient.ec_id IS
    'Identifier of the emergency contact for the patient';
-- Add all missing FK Constraints below here
ALTER TABLE patient
    ADD CONSTRAINT ec_fk FOREIGN KEY ( ec_id )
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
    ADD CONSTRAINT nurse_appointment_fk FOREIGN KEY ( nurse_no )
        REFERENCES nurse ( nurse_no );
        
ALTER TABLE appointment
    ADD CONSTRAINT appointment_appointment_fk FOREIGN KEY ( appt_prior_apptno )
        REFERENCES appointment ( appt_prior_apptno );
