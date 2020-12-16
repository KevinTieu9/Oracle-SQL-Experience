/*
Kevin Tieu
12-04-2020
325 Fall 2020
Final Project
*/

spool Query-results.txt
set feedback off
SET WRAP off


SET LINESIZE 2000
SET LONG 200000


Prompt QUERY 1
Prompt
Prompt Used to check  which competancy level students are 
Prompt enrolling in to better understand which classes our store needs to add.
Prompt Also gives us a bigger picture of where students will end up in.
Prompt
SELECT CompetencyLevel, COUNT(*) as TotalStudents
FROM MusicLesson
GROUP BY CompetencyLevel;

Prompt
Prompt QUERY 2
Prompt
Prompt Used to check Customer Data and Payment type
Prompt To see if a customer has outstanding charges or never paid
Prompt This allows the system to automatically prevent a customer from renting
Prompt or enrolling in a new class until dues are paid, repeat offenders get blacklisted.
Prompt
Prompt Will use AUTOMATED Email, Phone, and Physical Email to address to CLAW BACK money LOST.
Prompt ABOUT 500 CUSTOMERS WITH OVERDUE CHARGES!!!!?!!!????!!!!!
Prompt What kind of business do you think I am running, a real charity?
Prompt

COLUMN Payee FORMAT A20;
COLUMN CusID FORMAT 9990;
COLUMN Paid FORMAT A4;
COLUMN Address FORMAT A65;
COLUMN Phone FORMAT A14;
COLUMN Email FORMAT A30;

SELECT PaymentType.PaymentName as Payee, PaymentType.PaymentID as CusID, PaymentType.PaymentPaid as Paid, 
       Customer.CustomerAddress as Address, Customer.CustomerPhone as Phone, Customer.CustomerEmail as Email
FROM PaymentType
FULL OUTER JOIN Customer
ON PaymentType.PaymentID = Customer.CustomerID
Where PaymentPaid = 'No'
Order by PaymentID; 

Prompt
Prompt QUERY 3
Prompt Used to check in with who is the one who donated the Instrument
Prompt in the Donation Log as well as to check in with who is the person
Prompt playing the instrument in during the reception held at the store
Prompt to place during the reception day so that customers or participants 
Prompt can see who is who.

SELECT DonationLog.DonatorName as Donator, DonationLog.DonationDate as DonateDate, MusicReception.MusicianName, 
       MusicReception.ReceptionDate ReceptionDay
FROM DonationLog
FULL OUTER JOIN MusicReception
ON DonationLog.DonatorID = MusicReception.ReceptionID
Order by DonatorName, DonationDate, MusicianName, ReceptionDate;

Prompt
Prompt QUERY 4
Prompt
Prompt Averages the total amount for each instrument type
Prompt the average vote count for that instrument type
Prompt this makes it easier to understand what
Prompt is our most popular instrument type Reception attendances
Prompt and allows us to better appropriate instrument types that 
Prompt that will have more attendance.

SELECT InstrumentName, round(Avg(VoteCountTotal), 0) as "Vote Average", 
       round(avg(CustomerParticipant), 0) as "Customer Average Attendance"
FROM MusicReception
Group BY InstrumentName
Order BY InstrumentName;

Prompt
PROMPT QUERY 5
Prompt
Prompt Used to check the Instrument Type
Prompt Whether it Minor, Intermediate, Major
Prompt Finds which types of repairs are common.

SELECT InstrumentType, 
Count(case RepairType when 'Minor' then 1 else null end) as "Minor Repair Total",
Count(case RepairType when 'Intermediate' then 1 else null end) as "Intermediate Repair Total",
Count(case RepairType when 'Major' then 1 else null end) as "Major Repair Total"
FROM InstrumentRepair
Group BY InstrumentType
Order BY InstrumentType;

Prompt
Prompt Query 6
Prompt
Prompt Averages the cost of minor, Intermediate, and Major repairs of each instrument
Prompt can be shown along with Query 5 to see whether there needs to be an increase
Prompt of average price or a decrease.

SELECT InstrumentType, 
avg(RepairPrice) as "Minor"
FROM InstrumentRepair
where RepairType = 'Minor'
Group BY InstrumentType
Order BY InstrumentType;

SELECT InstrumentType, 
avg(RepairPrice) as "Intermediate"
FROM InstrumentRepair
where RepairType = 'Intermediate'
Group BY InstrumentType
Order BY InstrumentType;

SELECT InstrumentType, 
avg(RepairPrice) as "Major"
FROM InstrumentRepair
where RepairType = 'Major'
Group BY InstrumentType
Order BY InstrumentType;

Prompt
Prompt QUERY 7
Prompt
Prompt looks for class size that is less than 5
Prompt that isn't Piano or Drums because
Prompt Drums and Piano take a lot of space.
Prompt Takes a look to prevent classes from starting before before 
Prompt a threshold is passed

SELECT LessonType, ClassSize, ClassStartDate
FROM MusicLesson
where ClassSize < 5 and NOT LessonType = 'Piano' and NOT LessonType = 'Drums'
Order BY ClassStartDate;

Prompt
Prompt QUERY 8
Prompt
Prompt checks to see the all the Music receptions in a certain month (For example, February in this case.)
Prompt Good to know to have all the reception day of our musicians on a given day so
Prompt that it isn't overbooked.

SELECT MusicianName, ReceptionDate
FROM MusicReception
where MusicianName in(
    Select MusicianName
    From MusicReception
    Where ReceptionDate >= '01-FEB-20' and ReceptionDate <= '25-FEB-20')
Order By ReceptionDate;

spool off;