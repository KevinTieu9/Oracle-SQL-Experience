/*
Kevin Tieu
CS 325 - Fall 2020
Project Design Milestone
11/15/2020
*/

spool CS325Proj.txt

/*
Used to Create the Customer table
Consists of the Customer Name, 
email, phone, address
primary key is customer name

*/

drop table Customer cascade constraints;
create table Customer
(CustomerID int,
CustomerName varchar2(30),
CustomerEmail varchar2(30),
CustomerPhone varchar2(30),
CustomerAddress varchar2(50),
primary key (CustomerID)
);

/*
Used to Create the Instrument table
Consists of the Instrument Name, Level, and Price
Instrument Name is the Primary key)
*/
drop table Instrument cascade constraints;
create table Instrument
(InstrumentName varchar2(20), 
InstrumentLevel varchar2(20), 
Price Decimal(3, 2), 
primary key (InstrumentName)
);

/*
Used to Create the InstrumentRepair table
Consists of the Instrument Type (wind? string? etc), 
the type of repair it needs, 
the repair request and finish date
price is the cost to repair
Instrument Type is the Primary key)
*/

drop table InstrumentRepair cascade constraints;
create table InstrumentRepair
(InstrumentID int,
InstrumentName varchar2(20), 
InstrumentLevel varchar2(20), 
InstrumentPrice Decimal(10, 2), 
primary key (InstrumentID)
);

/*
Used to Create the MusicLesson table
Consists of the Competancy Level (Beginner? Intermediate? Advanced?), 
Lesson Type, 
Class size, start, end date, and price
Competancy is the Primary key)
*/

drop table MusicLesson cascade constraints;
create table MusicLesson
(MusicLessonID int, 
StudentName varchar2(40),
CompetencyLevel varchar2(20),
LessonType varchar2(20),
ClassSize int,
ClassStartDate date,
ClassEndDate date,
LessonPrice Decimal(10, 2),
primary key (MusicLessonID)
);

/*
Used to Create the payment type table
Consists of the cash 
credit card
and rental

*/

drop table PaymentType cascade constraints;
create table PaymentType
(PaymentID int,
PaymentName varchar2(50),
CashPayment varchar2(3),
CreditCard varchar2(20),
Rental varchar(3),
PaymentPaid varchar2(3),
primary key (PaymentID),
foreign key (PaymentID) references Customer(CustomerID)
);


/*
Used to Create the MusicReception table
Consists of the Musician Name (Person that is doing the recital), 
Instrument name that is being used, references Instrument type in donation log
vote count of what instrument being played
customer participant that reference customer name of customer

*/

drop table MusicReception cascade constraints;
create table MusicReception
(ReceptionID int,
MusicianName varchar2(30),
InstrumentName varchar2(20),
CustomerParticipant INT,
VoteCountTotal INT,
ReceptionDate date,
PRIMARY KEY (ReceptionID),
foreign key (ReceptionID) references Donationlog(DonatorID)
);

/*
Used to Create the donation log table
Consists of the Donation Name (the donator), 
Instrument type/name,
the day it was donated
primary key is donator name

*/
drop table DonationLog cascade constraints;
create table DonationLog
(DonatorID int,
DonatorName varchar2(50),
InstrumentType varchar2(20),
DonationDate DATE,
PRIMARY KEY (DonatorID)
);

spool off 
