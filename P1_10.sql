PRAGMA foreign_keys=OFF;
BEGIN TRANSACTION;

/* Question 10) Produce a table that lists the name of all the service-subscribers that subscribe to at least all 
    the same services as Jason Allison subscribes to but possibly others as well. Jason Allison rents the line 
    with portID=2. (So this is the classic "subset" query.)*/

SELECT name FROM subscribers s WHERE NOT EXISTS
    (SELECT service FROM service_subscribers WHERE service_subscribers.portid = 2
    EXCEPT
    SELECT service FROM service_subscribers WHERE service_subscribers.portid = s.portid);
COMMIT;

-- Test output

/* 
sqlite> .read P1_10.sql
name
--------------
Jason Allison
Michael Jordan
Joe Carter
Homer Simpson
Matt Stajan
sqlite> */