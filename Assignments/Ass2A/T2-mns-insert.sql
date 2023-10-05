--*****PLEASE ENTER YOUR DETAILS BELOW*****
--T2-mns-insert.sql

--Student ID:
--Student Name:
--Unit Code:
--Applied Class No:

/* Comments for your marker:



*/

--------------------------------------
--INSERT INTO emergency_contact
--------------------------------------
-- Emergency Contact 1
INSERT INTO emergency_contact VALUES (
    1,
    'John',
    'Smith',
    '1234567890'
);

-- Emergency Contact 2
INSERT INTO emergency_contact VALUES (
    2,
    'Jane',
    'Doe',
    '9876543210'
);

-- Emergency Contact 3
INSERT INTO emergency_contact VALUES (
    3,
    'Alice',
    'Johnson',
    '5557778888'
);

-- Emergency Contact 4
INSERT INTO emergency_contact VALUES (
    4,
    'Bob',
    'Wilson',
    '1112223333'
);

-- Emergency Contact 5
INSERT INTO emergency_contact VALUES (
    5,
    'Emily',
    'Brown',
    '9990001111'
);

--------------------------------------
--INSERT INTO patient
--------------------------------------
-- Adult Patients (5)
INSERT INTO patient VALUES (
    1,
    'John',
    'Doe',
    '123 Main St',
    'Darwin',
    'NT',
    '1234',
    TO_DATE('15/01/1990', 'dd/mm/yyyy'),
    '0412345678',
    'john@gmail.com',
    1
);

INSERT INTO patient VALUES (
    2,
    'Alice',
    'Smith',
    '456 Elm St',
    'Sydney',
    'NSW',
    '5678',
    TO_DATE('20/03/1985', 'dd/mm/yyyy'),
    '0423456789',
    'alice@gmail.com',
    2
);

INSERT INTO patient VALUES (
    3,
    'Michael',
    'Johnson',
    '789 Oak St',
    'Melbourne',
    'VIC',
    '6789',
    TO_DATE('10/06/1988', 'dd/mm/yyyy'),
    '0434567890',
    'michael@gmail.com',
    1
);

INSERT INTO patient VALUES (
    4,
    'Sarah',
    'Wilson',
    '101 Maple St',
    'Adelaide',
    'SA',
    '8901',
    TO_DATE('05/09/1987', 'dd/mm/yyyy'),
    '0445678901',
    'sarah@gmail.com',
    3
);

INSERT INTO patient VALUES (
    5,
    'David',
    'Brown',
    '111 Pine St',
    'Brisbane',
    'QLD',
    '3456',
    TO_DATE('25/02/1986', 'dd/mm/yyyy'),
    '0456789012',
    'david@gmail.com',
    4
);

-- Underage Patients (5)
INSERT INTO patient VALUES (
    6,
    'Emma',
    'Anderson',
    '222 Birch St',
    'Perth',
    'WA',
    '1234',
    TO_DATE('12/07/2010', 'dd/mm/yyyy'),
    '0467890123',
    'emma@gmail.com',
    5
);

INSERT INTO patient VALUES (
    7,
    'Oliver',
    'Martin',
    '333 Cedar St',
    'Hobart',
    'TAS',
    '2345',
    TO_DATE('05/04/2011', 'dd/mm/yyyy'),
    '0478901234',
    'oliver@gmail.com',
    1
);

INSERT INTO patient VALUES (
    8,
    'Sophia',
    'Thompson',
    '444 Fir St',
    'Canberra',
    'ACT',
    '4567',
    TO_DATE('15/10/2012', 'dd/mm/yyyy'),
    '0489012345',
    'sophia@gmail.com',
    2
);

INSERT INTO patient VALUES (
    9,
    'Liam',
    'Hall',
    '555 Pine St',
    'Darwin',
    'NT',
    '5678',
    TO_DATE('30/03/2013', 'dd/mm/yyyy'),
    '0490123456',
    'liam@gmail.com',
    4
);

INSERT INTO patient VALUES (
    10,
    'Mia',
    'Clark',
    '666 Oak St',
    'Sydney',
    'NSW',
    '6789',
    TO_DATE('18/12/2014', 'dd/mm/yyyy'),
    '0491234567',
    'mia@gmail.com',
    5
);

--------------------------------------
--INSERT INTO appointment
--------------------------------------
INSERT INTO appointment VALUES (
    1,
    TO_DATE('15/5/2023 09:00', 'dd/mm/yyyy hh24:mi'),
    1,
    'S',
    1,
    'END001',
    2,
    NULL
);

INSERT INTO appointment VALUES (
    2,
    TO_DATE('15/5/2023 12:00', 'dd/mm/yyyy hh24:mi'),
    2,
    'T',
    2,
    'ORT001',
    4,
    NULL
);

INSERT INTO appointment VALUES (
    3,
    TO_DATE('15/5/2023 13:00', 'dd/mm/yyyy hh24:mi'),
    3,
    'L',
    3,
    'GEN001',
    1,
    NULL
);

-- Appointments on Date 2
INSERT INTO appointment VALUES (
    4,
    TO_DATE('15/6/2023 09:00', 'dd/mm/yyyy hh24:mi'),
    4,
    'S',
    4,
    'END001',
    5,
    NULL
);

INSERT INTO appointment VALUES (
    5,
    TO_DATE('15/6/2023 11:00', 'dd/mm/yyyy hh24:mi'),
    5,
    'T',
    5,
    'ORT001',
    8,
    NULL
);

INSERT INTO appointment VALUES (
    6,
    TO_DATE('15/6/2023 14:30', 'dd/mm/yyyy hh24:mi'),
    1,
    'L',
    6,
    'GEN001',
    12,
    NULL
);

-- Appointments on Date 3
INSERT INTO appointment VALUES (
    7,
    TO_DATE('20/7/2023 09:00', 'dd/mm/yyyy hh24:mi'),
    2,
    'S',
    7,
    'END001',
    2,
    NULL
);

INSERT INTO appointment VALUES (
    8,
    TO_DATE('20/7/2023 10:00', 'dd/mm/yyyy hh24:mi'),
    3,
    'T',
    8,
    'ORT001',
    10,
    NULL
);

INSERT INTO appointment VALUES (
    9,
    TO_DATE('20/7/2023 10:30', 'dd/mm/yyyy hh24:mi'),
    4,
    'L',
    9,
    'GEN001',
    1,
    NULL
);

INSERT INTO appointment VALUES (
    10,
    TO_DATE('20/7/2023 09:00', 'dd/mm/yyyy hh24:mi'),
    5,
    'S',
    10,
    'PED001',
    4,
    NULL
);

-- Additional Appointments (Parallel, Different Providers, Nurses, and Follow-ups)
INSERT INTO appointment VALUES (
    11,
    TO_DATE('20/7/2023 09:00', 'dd/mm/yyyy hh24:mi'),
    5,
    'S',
    1,
    'PRO001',
    10,
    1
);

INSERT INTO appointment VALUES (
    12,
    TO_DATE('15/5/2023 09:00', 'dd/mm/yyyy hh24:mi'),
    4,
    'S',
    5,
    'PER002',
    1,
    NULL
);

INSERT INTO appointment VALUES (
    13,
    TO_DATE('20/7/2023 10:00', 'dd/mm/yyyy hh24:mi'),
    6,
    'T',
    6,
    'PED001',
    4,
    6
);

INSERT INTO appointment VALUES (
    14,
    TO_DATE('15/6/2023 14:30', 'dd/mm/yyyy hh24:mi'),
    2,
    'T',
    9,
    'GEN001',
    3,
    NULL
);

INSERT INTO appointment VALUES (
    15,
    TO_DATE('20/7/2023 10:00', 'dd/mm/yyyy hh24:mi'),
    3,
    'S',
    5,
    'PRO001',
    12,
    5
);

COMMIT;