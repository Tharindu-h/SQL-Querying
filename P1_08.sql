PRAGMA foreign_keys=OFF;
BEGIN TRANSACTION;
/*  Question 8) Write an SQL query that would find if the line with phone number (613) 712-0024 is currently 
    available to take a call because its channel is IDLE. Rev 1: That is, select the portid, directory number, and channel state of line (613) 712-0024. */

SELECT DISTINCT(lines.portid), (areacode || "-" || officecode || "-" || stationcode) AS directory, state FROM lines, channels WHERE lines.portid IN 
    (SELECT portid FROM lines WHERE areacode = "613" AND officecode = "712" AND stationcode = "0024")
    AND state IN 
    (SELECT state FROM channels WHERE portid = lines.portid);

COMMIT;

-- Test output

/* 
sqlite> .read P1_08.sql
portid  directory     state
------  ------------  -----
24      613-712-0024  BUSY
sqlite>
 */