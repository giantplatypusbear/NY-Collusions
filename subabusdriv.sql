DROP TABLE IF EXISTS SUBSTANCE_ABUSED_DRIVING_BY_AGE;
CREATE TABLE SUBSTANCE_ABUSED_DRIVING_BY_AGE(
AGE INTEGER ,
COUNTOFSUBDRIVING INTEGER

);
INSERT INTO SUBSTANCE_ABUSED_DRIVING_BY_AGE (AGE, COUNTOFSUBDRIVING)
SELECT 
    PERSON_AGE,
    SUM(CASE WHEN PRIMARY_CONTRIBUTING_FACTOR = 'Alcohol Involvement' THEN 1 ELSE 0 END) + SUM(CASE WHEN PRIMARY_CONTRIBUTING_FACTOR = 'Drugs (illegal)' THEN 1 ELSE 0 END)
AS COUNTOFSUBDRIVING
FROM ny_col_merge2
WHERE PERSON_ROLE= 'Driver' AND PERSON_AGE BETWEEN 0 AND 100
GROUP BY PERSON_AGE
;

