PRAGMA foreign_keys=OFF;
BEGIN TRANSACTION;
/* Question 3) List the names of all the subscribers who are originators of a call to someone who is also a subscriber on the same switch (i.e. a line to line call) */

SELECT name FROM subscribers JOIN
    (SELECT orig, term FROM calls WHERE orig IN 
    (SELECT portid FROM lines) AND term IN (SELECT portid FROM lines))
    ON subscribers.portid = orig;

COMMIT;

-- Test output
/* 
sqlite> .read P1_03.sql
name
--------------
Mats Sundin
Jason Allison
Homer Simpson
Michael Jordan
Ed Belfour
sqlite>
 */