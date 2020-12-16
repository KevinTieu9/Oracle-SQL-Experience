/*
Kevin Tieu
12-04-2020
325 Fall 2020
Reports4
*/

spool Report4.txt

set feedback off
set linesize 500
set long 10000000
SET wrap off

Prompt GENERATE INSTRUMENT NAME, THEIR CORRESPONDING LEVEL AND INSTRUMENT
PROMPT PRICE, ALSO HAS AN INSTRUMENT ID FOR CUSTOMERS TO CHOOSE A SPECIFIC TYPE.

SET PAGESIZE 20
SET PAUSE ON
SET PAUSE "Press ENTER to continue reading a list Instrument and their prices . . . "

ttitle Left 'Instrument level and their prices.' skip 2

BREAK ON InstrumentName


SELECT InstrumentID, InstrumentName, InstrumentLevel, InstrumentPrice
FROM Instrument
Order By InstrumentName;

spool off;