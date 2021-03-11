PRAGMA foreign_keys=OFF;
BEGIN TRANSACTION;
/*  Question 9) Do the same as question 1.7 but this time only include trunks that have at least one 'IDLE' channel. 
    That is, write an SQL query that will produce in one table a list of all the acceptable trunks that can be used to route a 
    call to the 416 area code, office code 334 have at least one idle channel. This query should list the trunks in the order of 
    preference. (The answer should list trunks routes 416,334 then 416,000 then 000,000 for example) */

SELECT portid FROM (SELECT DISTINCT(portid) FROM trunk_routes WHERE area = "416" OR area ="000")
    WHERE portid IN 
    (SELECT DISTINCT(portid) FROM channels WHERE state = "IDLE");
COMMIT;

-- Test output

/* 
sqlite> .read P1_09.sql
portid
------
102
106
107
sqlite> */