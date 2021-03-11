PRAGMA foreign_keys=OFF;
BEGIN TRANSACTION;
/* Question 5) Find the names of all the subscribers who subscribe to at least three services. */

SELECT name FROM service_subscribers JOIN subscribers ON
    (subscribers.portid = service_subscribers.portid)
    WHERE service = "MSG" OR service = "CWT" OR service = "CFB" OR service = "DSP" OR service = "3WC"
    GROUP BY name
    HAVING count(name) >= 3;

COMMIT;

-- Test output
/* 
sqlite> .read P1_05.sql
name
--------------
Chris Pronger
Frank Thomas
Homer Simpson
Joe Carter
Matt Stajan
Michael Jordan
Steve Sampras
Vince Carter
sqlite> */