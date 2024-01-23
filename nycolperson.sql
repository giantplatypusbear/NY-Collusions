DROP TABLE IF EXISTS PERSON_1NF;
CREATE TABLE PERSON_1NF (
   PERSON_ID INTEGER PRIMARY KEY,
   COLLISION_ID INTEGER,
   PERSON_TYPE TEXT,
   PERSON_ROLE TEXT,
   PERSON_AGE INTEGER,
   PERSON_SEX TEXT,
   PERSON_INJURY TEXT,
   VEHICLE_ID INTEGER,
   SAFETY_EQUIPMENT TEXT
);
INSERT INTO PERSON_1NF (PERSON_ID,COLLISION_ID, PERSON_TYPE,PERSON_ROLE, PERSON_AGE, PERSON_SEX, PERSON_INJURY, VEHICLE_ID, SAFETY_EQUIPMENT)
SELECT
     UNIQUE_ID AS PERSON_ID,
     COLLISION_ID,
     PERSON_TYPE,
     CASE 
         WHEN PERSON_TYPE = 'In-Line Skater' THEN 'Driver'
         ELSE PED_ROLE 
     END AS PERSON_ROLE,
     CASE 
         WHEN PERSON_AGE<=120 & PERSON_AGE>=0 THEN PERSON_AGE
         ELSE NULL 
     END AS PERSON_AGE,
     CASE 
         WHEN PERSON_SEX IS NULL THEN 'U'
         ELSE PERSON_SEX
     END AS PERSON_SEX,
     PERSON_INJURY,
     VEHICLE_ID,
     SAFETY_EQUIPMENT
FROM 
     PERSON_0NF
WHERE 
     PERSON_ROLE IS NOT NULL
     AND PERSON_ROLE NOT IN ('Owner', 'Registrant', 'Witness', 'Notified Person', 'Other');

