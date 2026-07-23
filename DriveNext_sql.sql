create database DriveDB;
use DriveDB;

create table Userss
(UserID int primary key, UserName varchar (20), Email varchar (20), Phone varchar (20), City varchar (10));

insert into Userss values(1011,'John','john@gmail.com',00595978,'Kalyan'),(1012,'Steve','steve@gmail.com',00595976,'Thane'),(1013,'Sara','sara@gmail.com',00595977,'Dadar');
select * from Userss;

create table Drivers
(DriverID int primary key,DriverName varchar (20),Phone varchar (15),LicenseNo varchar(50), Ratings int check (Ratings between 1 and 5));

insert into Drivers values(001,'Rahul',00001212,'ABC001',5),(002,'Amit',00001213,'XYZ002',3),(003,'Rohit',00001214,'STT001',4);
select * from Drivers;

create table Vehicles
(VehicleID int primary key,DriverID int,VehicleNumber varchar (20),VehicleType varchar (50),foreign key (DriverID) references Drivers(DriverID));

insert into Vehicles values(101,001,'MH05ER1234','car'),(102,002,'MH03ED1246','bike'),(103,003,'MH15IU8934','car');
select * from Vehicles;

create table RideDetailss
(RideID int primary key,UserID int,DriverID int,VehicleID int, Distance_KM decimal(10,2),Fare decimal(10,2),Status varchar(30),
foreign key(UserID) references Userss(UserID),foreign key(DriverID) references Drivers(DriverID),foreign key (VehicleID) references Vehicles(VehicleID));

insert into RideDetailss values(201,1011,001,101,16,700,'Pending'),(202,1012,002,102,10,1900,'Completed'),(203,1013,003,103,6,400,'Pending');
select * from RideDetailss;

create table Paymentss
(PaymentID int primary key,RideID int,Amount decimal(10,2),PaymentMethod varchar(30),PaymentStatus varchar(30),
foreign key (RideID) references RideDetailss(RideID));

insert into Paymentss values(3001,201,700,'Cash','Completed'),(3002,202,1900,'UPI','Completed'),(3003,203,400,'UPI','Pending');
select * from Paymentss;

create table Service
(ServiceID int primary key,UserID int,Reviews varchar(50),Ratings int check (Ratings between 1 and 5), foreign key(UserID) references Userss(UserID));

insert into Service values(400,1011,'Good',4),(401,1012,'Excellent',5),(402,1013,'Good',3);
select * from Service;
