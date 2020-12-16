/*
Kevin Tieu
12-04-2020
325 Fall 2020
Reports3
*/

spool Report3.txt

set feedback off
set linesize 500
set long 10000000
SET wrap off

Prompt GENERATES ALL CUSTOMERS THAT HAVEN'T PAID THEIR DUES
PROMPT HIDES ALL DUPLICATE "NO" ANSWER AS EVERYONE LISTED HASN'T PAID

SET PAGESIZE 20
SET PAUSE ON
SET PAUSE "Press ENTER to continue reading a list of our Donators and Musicians . . . "

ttitle Left 'CUSTOMERS THAT HAVE NOT PAID.' skip 2

SET PAGESIZE 20
SET PAUSE ON
SET PAUSE "Press ENTER to continue reading overdue charges . . . "

COLUMN Payee FORMAT A20;
COLUMN "Customer ID" FORMAT 9990;
COLUMN Paid FORMAT A4;
COLUMN Address FORMAT A65;
COLUMN Phone FORMAT A14;
COLUMN Email FORMAT A30;

BREAK ON Paid 

SELECT PaymentType.PaymentName as Payee, PaymentType.PaymentID as "Customer ID", PaymentType.PaymentPaid as Paid, 
       Customer.CustomerAddress as Address, Customer.CustomerPhone as Phone, Customer.CustomerEmail as Email
FROM PaymentType
FULL OUTER JOIN Customer
ON PaymentType.PaymentID = Customer.CustomerID
Where PaymentPaid = 'No'
Order by PaymentID;

spool off;