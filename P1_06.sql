PRAGMA foreign_keys=OFF;
BEGIN TRANSACTION;

/* Question 6) Produce a table that lists the most popular service (or services). That is, give the name of the service that has the most subscribers.*/
SELECT service FROM
    (SELECT service AS temp, MAX(COUNT) FROM
    (SELECT service, count(service) AS count FROM service_subscribers
    GROUP BY service)), services
    WHERE temp = services.scode;

COMMIT;

-- Test output

/* 
sqlite> .read P1_06.sql
service
--------------
Message Answer
sqlite> */