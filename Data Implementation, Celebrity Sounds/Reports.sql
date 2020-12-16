/*
Kevin Tieu
12-04-2020
325 Fall 2020
Reports2
*/

spool Report2.txt

set feedback off
set linesize 500
set long 10000000
SET wrap off

Prompt THIS REPORT GENERATES A MONTHLY DONATOR TO OUR STORE
PROMPT iT ALSO GENERATES A MUSICIAN THAT PLAYS THAT INSTRUMENT

SET PAGESIZE 20
SET PAUSE ON
SET PAUSE "Press ENTER to continue reading overdue charges . . . "

ttitle Center 'MONTHLY INSTRUMENT DONATION LOG AND MUSIC RECEPTION.' skip 2

SELECT DonationLog.DonatorName as Donator, DonationLog.DonationDate as DonateDate, MusicReception.MusicianName, 
       MusicReception.ReceptionDate ReceptionDay
FROM DonationLog
FULL OUTER JOIN MusicReception
ON DonationLog.DonatorID = MusicReception.ReceptionID
WHERE DonationDate >= '01-FEB-20' and DonationDate <= '25-FEB-20'
Order by DonatorName, DonationDate, MusicianName, ReceptionDate;

spool off;