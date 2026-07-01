create database BankDB;
use BankDB;

create table Customers
( CustomerID int primary key, FirstName varchar (20), LastName varchar (20), Email varchar (100), Phone varchar (15), AccountCreationDate date );

create table Accounts
( AccountID int primary key, CustomerID int, AccountType varchar (20), Balance decimal (10,2), foreign key (CustomerID) references Customers(CustomerID) );

create table Transactions
(TransactionID int primary key, AccountID int, TransactionDate date, Amount decimal (10,2), TransactionType varchar (20), foreign key (AccountID) references Accounts(AccountID) );

create table Branches
( BranchID int primary key, BranchName varchar (50), BranchAddress varchar (100), BranchPhone varchar (15) );

create table AccountBranches
(AccountID int, BranchID int, AssignmentDate date, foreign key (AccountID) references Accounts(AccountID), foreign key (BranchID) references Branches(BranchID) );

create table Loans
(LoanID int primary key, CustomerID int, LoanAmount decimal (10,2), InterestRate decimal (5,2), StartDate date, EndDate date, foreign key (CustomerID) references Customers(CustomerID) );

