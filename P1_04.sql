PRAGMA foreign_keys=OFF;
BEGIN TRANSACTION;
/* Question 4) Find the names and address of all subscribers who subscribe to all of the available services. 
(Note the result for the current data might be empty but your query should work if the TA's add more data to the databse.) */

SELECT name, address FROM subscribers WHERE portid IN
    (SELECT portid FROM service_subscribers WHERE portid IN
    (SELECT portid FROM service_subscribers WHERE service="MSG")
    AND portid IN
    (SELECT portid FROM service_subscribers WHERE service="CFB")
    AND portid IN
    (SELECT portid FROM service_subscribers WHERE service="CWT")
    AND portid IN
    (SELECT portid FROM service_subscribers WHERE service="DSP")
    AND portid IN 
    (SELECT portid FROM service_subscribers WHERE service="3WC"));

COMMIT;

-- Test output
/*
sqlite> .read P1_04.sql
sqlite> */