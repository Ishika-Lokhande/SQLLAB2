create database banksystemDB;
use banksystemDB;

create table Customerss
( CustomerID int primary key, FirstName varchar (20), LastName varchar (20), Email varchar (100), Phone varchar (15), AccountCreationDate date );
insert into Customerss values(1, 'Sam', 'Dsouza', 'sam@gmail.com', 98653278911,'2025-11-16'), (2, 'Adam', 'Dsouza', 'adam@gmail.com', 9865356711, '2025-11-24'), (3, 'Sara', 'Eden', 'sara@gmail.com', 87433278911, '2025-11-28'), (4, 'Eva', 'Paul', 'eva@gmail.com', 9856782833, '2025-11-28'), (5, 'Cathy', 'Dsouza', 'cathy@gmail.com', 7893532556, '2025-12-08'),
(6, 'Samuel', 'Bell', 'samuel@gmail.com', 8964225611, '2025-12-18'), (7, 'Mary', 'Ford', 'mary@gmail.com', 9867676791, '2025-12-24'), (8, 'Steve', 'Joseph', 'steve@gmail.com', 9967543911, '2026-01-14'), (9, 'Mathew', 'Evens', 'mathew@gmail.com', 7832459211, '2025-01-14'), (10, 'Ahana', 'Paul', 'ahana@gmail.com', 7794545232, '2026-02-16');

select * from Customerss;

create table Accountss
( AccountID int primary key, CustomerID int, AccountType varchar (20), Balance decimal (10,2), foreign key (CustomerID) references Customerss(CustomerID) );
insert into Accountss values (101, 1, 'Savings', 5000.00), (102, 2, 'Current', 25000.30), (103, 3, 'Savings', 15750.75), (104, 4, 'Current', 8450.00), (105, 5, 'Savings', 22000.20), (106, 6, 'Current',3245.00), (107, 7, 'Current', 12500.50), (108, 8, 'Savings', 9800.75), (109, 9, 'Current', 4500.00), (110, 10, 'Savings', 30500.90);

select * from Accountss;

create table Transactions
(TransactionID int primary key, AccountID int, TransactionDate date, Amount decimal (10,2), TransactionType varchar (20), foreign key (AccountID) references Accountss(AccountID) );
insert into Transactions values (1001, 101, '2025-01-20', 1500.00, 'Deposit'), (1002, 102, '2024-02-12', 500.00, 'Withdrawal'), (1003, 103, '2024-03-08', 2500.50, 'Deposit'), (1004, 104, '2024-04-15', 1200.00, 'Withdrawal'), (1005, 105, '2024-05-22', 3000.00, 'Withdrawal'), (1006, 106, '2024-06-19', 750.25, 'Withdrawal'), (1007, 107, '2024-07-28', 1800.00, 'Deposit'), (1008, 108, '2024-08-31', 950.75,'Deposit'), (1009, 109, '2024-09-16', 2200.00, 'Deposit'), (1010, 110, '2024-10-10', 1000.00, 'Withdrawal');

select * from Transactions;

create table Branches
( BranchID int primary key, BranchName varchar (50), BranchAddress varchar (100), BranchPhone varchar (15) );
insert into Branches values (1, 'Main Branch', '123 Main Street, New York', 5551110001), (2, 'Downtown Branch', '45 Market Street, Chicago', 5551110002),(3, 'Westside Branch', '78 Oak Avenue, Los Angeles', 5551110003),(4, 'Eastside Branch', '90 Pine Road, Boston', 5551110004),(5, 'North Branch', '12 Maple Street, Seattle', 5551110005),(6, 'South Branch', '34 River Road, Houston', 5551110006),(7, 'Central Branch', '56 King Street, Dallas',5551110007),(8, 'City Branch', '89 Queen Avenue, Miami', 5551110008),
(9, 'East Branch', 'XYZ Main Street, UAE', 5551110009), (10, 'South Branch', '456 Joey Street, USA', 5551110010);

select * from Branches;

create table AccountBranches
(AccountID int, BranchID int, AssignmentDate date, foreign key (AccountID) references Accountss(AccountID), foreign key (BranchID) references Branches(BranchID) );
insert into AccountBranches values (101,1,'2024-01-15'),(102, 2, '2024-02-10'),(103, 3, '2024-03-05'),(104, 4, '2024-04-12'),(105, 5, '2024-05-20'),(106, 6, '2024-06-18'),(107, 7, '2024-07-25'),(108, 8, '2024-08-30'),(109, 9, '2024-09-14'),(110, 10, '2024-10-08');
 
 select * from AccountBranches;

create table Loans
(LoanID int primary key, CustomerID int, LoanAmount decimal (10,2), InterestRate decimal (5,2), StartDate date, EndDate date, foreign key (CustomerID) references Customerss(CustomerID) );
insert into Loans values(1011, 1, 50000.00, 7.50, '2024-01-01', '2027-01-01'),(1012, 2, 120000.00, 8.25, '2024-02-15', '2029-02-15'),(1013, 3, 75000.00, 6.90, '2024-03-10', '2026-03-10'),(1014, 4, 30000.00, 9.00, '2024-04-05', '2025-04-05'),(1015, 5, 200000.00, 7.10, '2024-05-20', '2030-05-20'),(1016, 6, 45000.00, 8.75, '2024-06-18', '2028-06-18'),(1017, 7, 90000.00, 7.95, '2024-07-22', '2029-07-22'),(1018, 8, 150000.00, 6.50, '2024-08-30', '2031-08-30'),(1019, 9, 60000.00, 8.10, '2024-09-12', '2027-09-12'),(1010, 10, 110000.00, 7.40, '2024-10-08', '2030-10-08');

select * from Loans;
update Loans 
set LoanID='10110' where CustomerID='10';

create table CustomerBackup
(ID int, FirstName varchar (20), LastName varchar (20), Email varchar (20), Phone varchar (15), AccountCreationDate date) ;
insert into CustomerBackup(ID, FirstName, LastName, Email, Phone, AccountCreationDate)
select * from Customerss;

select * from CustomerBackup;
select CustomerID, FirstName,Email from Customerss;

select * from Customerss Order by FirstName;
select * from Customerss Order by FirstName desc;

select AccountType, sum(Balance) as Total from Accountss
group by AccountType; 

select TransactionType, sum(Amount) as Total from Transactions
group by TransactionType;

select * from Customerss limit 3;
select * from Customerss limit 3 offset 2;

select AccountType, sum(Balance) from Accountss
group by AccountType having sum(Balance)>20000.00;

select LastName from Customerss
where LastName like 'D%' ;

select LastName from Customerss
where LastName like '%D' ;

select LastName from Customerss
where LastName like '%D%' ;

select LastName from Customerss
where LastName like '_a%' ;

select FirstName from Customerss
where FirstName like '%A%' ;

describe Customerss;
insert into Customerss(CustomerID , FirstName , LastName  , Email , Phone) values (11, 'Sam', 'Dsouza', 'sam@gmail.com', 9865367671);

select * from Customerss where AccountCreationDate is null;
select * from Customerss where AccountCreationDate is not null;

insert into Customerss(CustomerID , FirstName , LastName,Phone, AccountCreationDate) values (21, 'John','Steve','456789','2026-05-04');
select * from Customerss where Email is null;

insert into Accountss(AccountID , CustomerID , AccountType) values (111, 11, 'Savings'); 
select * from Accountss where Balance is not null;
select * from Accountss where Balance is  null;

select LastName from Customerss order by LastName;
select * from Transactions order by Amount desc limit 5;

select * from Customerss limit 4 offset 3;

select distinct TransactionType from Transactions;

select LoanID, CustomerID, LoanAmount,
    LAG(LoanAmount) OVER(ORDER BY LoanAmount desc) AS PreviousLoanAmount FROM Loans;
    
SELECT LoanID, CustomerID, LoanAmount,
    LEAD(LoanAmount) OVER(ORDER BY LoanAmount DESC) AS NextLoanAmount FROM Loans;

select * from Customerss;
select * from Accountss;

select FirstName, LastName, Email, AccountType, Balance from Customerss join Accountss on Customerss.CustomerID=Accountss.CustomerID;

create table DEMO1
( ID int, Name varchar (20), age int);
insert into DEMO1(ID, Name, age) values (1, 'Sam', 14), (2, 'John', 23), (4, 'Sara', 25), (5, 'Steve', 15), (6, 'Ahana', 22);

create table DEMO2
( ID int, email varchar (20) );
insert into DEMO2(ID, email) values (1, 'sam@gmail.com'), (2,'john@gmail.com'), (3, 'sara@gmail.com'), (7, 'steve@gmail.com'), (8, 'ahana@gmail.com');

select Name, email from DEMO1 LEFT OUTER JOIN DEMO2 ON DEMO1.ID=DEMO2.ID;
select Name, email from DEMO1 RIGHT OUTER JOIN DEMO2 ON DEMO1.ID=DEMO2.ID;

select * from DEMO1 natural join DEMO2;

alter table DEMO1
add city varchar (20);

set sql_safe_updates=0;

update DEMO1 
SET city='kalyan' where ID=1;
update DEMO1 
SET city='Thane' where ID=2;
update DEMO1 
SET city='Pune' where ID=4;
update DEMO1 
SET city='Nerul' where ID=5;
update DEMO1 
SET city='Virar' where ID=6;

alter table DEMO2
add city varchar (20);
update DEMO2
SET city='kalyan' where ID=1;
update DEMO2
SET city='Dadar' where ID=2;
update DEMO2
SET city='Neral' where ID=3;
update DEMO2
SET city='Nerul' where ID=7;
update DEMO2
SET city='Thane' where ID=8;

select * from DEMO1;
select * from DEMO2;

SELECT * FROM DEMO1 NATURAL JOIN DEMO2;

SELECT * FROM DEMO1 CROSS JOIN DEMO2;
SELECT * FROM DEMO1,DEMO2;

alter table Customerss
add ReferalID int;

update Customerss set ReferalID=null where CustomerID=1; 
update Customerss set ReferalID=1 where CustomerID=2; 
update Customerss set ReferalID=2 where CustomerID=3; 
update Customerss  set ReferalID=3 where CustomerID=4; 
update Customerss set ReferalID=4 where CustomerID=5; 
update Customerss set ReferalID=4 where CustomerID=6; 
update Customerss set ReferalID=5 where CustomerID=7; 
update Customerss set ReferalID=6 where CustomerID=8; 
update Customerss  set ReferalID=7 where CustomerID=9; 
update Customerss set ReferalID=7 where CustomerID=10; 
update Customerss  set ReferalID=8 where CustomerID=11; 
update Customerss set ReferalID=9 where CustomerID=21; 


select e.FirstName as Customer, e1.FirstName as Referred from Customerss e join Customerss e1 on e.ReferalID= e1.CustomerID;

select FirstName, LastName from Customerss
where CustomerID = (select CustomerID from Accountss where AccountID=101);

select FirstName, LastName from Customerss
where CustomerID = (select CustomerID from Accountss where Balance=25000.00);

select FirstName, LastName from Customerss
where CustomerID in (select CustomerID from Accountss where Balance >= 5000.00);

select FirstName, LastName from Customerss
where CustomerID in (select CustomerID from Accountss where Balance <= 5000.00);

select FirstName, LastName from Customerss
where CustomerID in (select CustomerID from Accountss where Balance <> 5000.00);

select FirstName, LastName from Customerss
where CustomerID in (select CustomerID from Accountss where Balance = 5000.00);

select FirstName, LastName from Customerss
where CustomerID in (select CustomerID from Accountss where Balance > 5000.00);

select FirstName, LastName from Customerss
where CustomerID in (select CustomerID from Accountss where Balance < 5000.00);

select FirstName, LastName from Customerss
where CustomerID >=(select CustomerID from Accountss where Balance=25000.30);

select FirstName, LastName from Customerss
where CustomerID <=(select CustomerID from Accountss where Balance=25000.30);

select FirstName, LastName from Customerss
where CustomerID <>(select CustomerID from Accountss where Balance=25000.30);

select * from Customerss;
select * from Accountss;

select CustomerID, FirstName, LastName from Customerss
where CustomerID > any (select CustomerID from Accountss where AccountType = 'Savings');

select CustomerID, FirstName, LastName from Customerss
where CustomerID < any (select CustomerID from Accountss where AccountType = 'Savings');

select CustomerID, FirstName, LastName from Customerss
where CustomerID > all (select CustomerID from Accountss where AccountType = 'Savings');

select CustomerID, FirstName, LastName from Customerss
where CustomerID < all (select CustomerID from Accountss where AccountType = 'Savings');

select CustomerID, FirstName, LastName from Customerss
where CustomerID > any (select CustomerID from Accountss where AccountType = 'Current');

select CustomerID, FirstName, LastName from Customerss
where CustomerID < any (select CustomerID from Accountss where AccountType = 'Current');

select CustomerID, FirstName, LastName from Customerss
where CustomerID < all (select CustomerID from Accountss where AccountType = 'Current');

select CustomerID, FirstName, LastName from Customerss
where CustomerID = all (select CustomerID from Accountss where AccountType = 'Current');

select CustomerID, FirstName, LastName from Customerss
where CustomerID = any (select CustomerID from Accountss where AccountType = 'Current');

create view view_Customerss as select CustomerID, FirstName, LastName, Email from Customerss;
select * from view_Customerss;
insert into view_Customerss values (111,'Adam','Dsouza','adam@gmail.com'),(112,'Sam','Steve','sam@gmail.com'),(113,'Eva','Joseph','eva@gmail.com');
select * from view_Customerss;
select * from Customerss;

update view_Customerss
set FirstName='Samauel', LastName='Dsouza' where CustomerID = 1;
delete from view_Customerss where CustomerID=113;

create view view_Detailss as
select CustomerID, concat(FirstName,' ',LastName) as Name, Email from Customerss;
select * from view_Detailss;

insert into view_Detailss(CustomerID, Email) values (101,'samuel@gmail.com'), (102, 'sara@gmail.com');

update view_Detailss
set Name='John' where CustomerID=101;

update view_Detailss
set Email='John@gmail.com' where CustomerID=101;
delete from view_Detailss where CustomerID=101;

alter view view_Detailss as
select CustomerID, FirstName, Email from Customerss;

create or replace view view_Detailss as
select CustomerID, FirstName, Email , Phone from Customerss;
select * from view_Detailss;

create view view_transactionss as
select TransactionType, sum(Amount) as total from Transactions
group by TransactionType
order by sum(Amount);

insert into view_transactionss (TransactionType, Amount) values ('withdrawal', 2489),('deposoit', 3456),('deposit', 78788),('withdrawal',999);
delete from view_transactionss where Amount=78788;
select * from view_transactionss;

desc Loans;

create view view_Loans11 as 
select LoanID, LoanAmount, InterestRate, StartDate from Loans
where LoanID > 1015
with check option;
insert into view_Loans11 values (10111,56566,7.50,'2026-01-01');

select * from view_Loans1;

create or replace view vw_loans_transactions
as select FirstName , LastName , Email ,Balance , AccountType 
from Customerss join Accountss 
on Customerss.CustomerID = 
Accountss.CustomerID;

insert into vw_Loans_transactions values ('Ishika', 'Lokhande','ishika@gmail.com', 54666, 'Savings');
update vw_Loans_transactions
set AccountType='Withdrawal' where FirstName='Ishika';
delete from vw_Loans_transactions where FirstName='Ishika';

show index from Customerss;
create unique index idx_TransactionType on Transactions(TransactionType);
explain select * from Transactions where TransactionType='Deposit';






 





































    






 

