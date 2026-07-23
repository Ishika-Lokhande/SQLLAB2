create database LogisticsDB;
use LogisticsDB;

create table Customers
(CustomerID int primary key, Name varchar (20), Email varchar (20), Phone varchar (20), City varchar (10) );

insert into Customers values(1,'Rahul Sharma','9876543210','rahul@gmail.com','Vashi'),(2,'Priya Patil','9876543211','priya@gmail.com','Mumbai'),(3,'Amit Joshi','9876543212','amit@gmail.com','Dadar'),(4,'Sneha Kulkarni','9876543213','sneha@gmail.com','Kalyan'),(5,'Rohan Deshmukh','9876543214','rohan@gmail.com','Thane');
select * from Customers;
alter table Customers
rename column Email to Phone,rename column Phone to Email;

create table Suppliers 
(SupplierID int primary key,SupplierName varchar (20),Phone varchar(15),Email varchar (20), City varchar (20));

insert into Suppliers values(101,'ABC Electronics','9876500001','abc@gmail.com','Delhi'),(102,'Fresh Foods Ltd','9876500002','fresh@gmail.com','Pune'),(103,'Global Textiles','9876500003','global@gmail.com','Surat'),(104,'Tech Solutions','9876500004','tech@gmail.com','Bangalore'),(105,'Prime Furniture','9876500005','prime@gmail.com','Jaipur');
select * from Suppliers;

create table Warehouse
 (WarehouseID int primary key, WarehouseName varchar (50) ,Location varchar (50),Capacity int);

 insert into Warehouse values(2001,'Central Warehouse','Mumbai',1000),(2002,'North Warehouse','Dadar',1200),(2003,'South Warehouse','Vashi',900),(2004,'West Warehouse','Thane',1500),(2005,'East Warehouse','Mumbai',800);
select * from Warehouse;
delete from Warehouse where WarehouseID in (201, 202, 203, 204, 305);

create table Productss
(ProductID int primary key, ProductName varchar (15), Category varchar (10), Quantity int, Price decimal (10,2) ,SupplierID int,
WarehouseID int, foreign key(SupplierID) references Suppliers(SupplierID),foreign key(WarehouseID) references  Warehouse(WarehouseID));

insert into Productss values(301,'Laptop','Electronics',30,55000,101,2001),(302,'Rice Bag','Food',100,1200,102,2004),(303,'Cotton Shirt','Clothing',150,899,103,2002),(304,'Printer','Electronics',50,1999,104,2003),(305,'Office Chair','Furniture',40,4500,105,2005);
alter table Productss
modify column Category varchar (20);
select * from Productss;

create table Orders
 (OrderID int primary key,CustomerID int,ProductID int, Quantity int, OrderDate date ,TotalAmount decimal(10,2),
 foreign key(CustomerID) references Customers(CustomerID), foreign key(ProductID) references Productss(ProductID));
 
 insert into Orders values(401,1,301,1,'2025-04-15',55999),(402,2,302,3,'2025-05-25',3690),(403,3,303,2,'2025-05-30',1800),(404,4,304,1,'2025-06-05',2100),(405,5,305,4,'2025-06-23',18500);
 select * from Orders;
 
 create table Shipments
 (ShipmentID int primary key, OrderID int, WarehouseID int, ShipmentDate date, DeliveryDate date, ShipmentStatus varchar (20), 
 foreign key (OrderID) references Orders(OrderID), foreign key (WarehouseID) references Warehouse(WarehouseID));
 
 insert into Shipments values(5001,401,2001,'2025-04-19','2025-04-20','Processing'),(5002,402,2002,'2025-05-29','2025-05-30','Dispatched'),(5003,403,2003,'2025-06-04','2025-06-05','Pending'),(5004,404,2004,'2025-06-09','2025-06-10','Out for Delivery'),(5005,405,2005,'2025-06-27','2025-06-28','Packed');
 select * from Shipments;
 delete from Shipments where ShipmentID in (501, 502, 503, 504, 505);
 
 create table Payments
 (PaymentID int primary key,OrderID int, PaymentDate date, Amount decimal(10,2), PaymentMethod varchar (20),
 PaymentStatus varchar(30),foreign key(OrderID) references Orders(OrderID));
 
 insert into Payments values(001,401,'2025-04-15',55999,'Debit card','Completed'),(002,402,'2025-05-29',3690,'UPI','Pending'),(003,403,'2025-06-05',1800,'Cash','Completed'),(004,404,'2025-06-10',2100,'Cash','Pending'),(005,405,'2025-06-28',18500,'UPI','Completed');
 select * from Payments;
 
 create table Service
 ( ServiceID int primary key, OrderID int,ServiceType varchar(20), ComplaintStatus varchar (100), Reviews varchar (50),Ratings int check (Ratings between 1 and 5),SupportContact varchar(15),
foreign key(OrderID) references Orders(OrderID));

insert into Service values(1011,401,'Return','Wrong product received','Poor service',2,00005959),(1012,402,'-','-','Excellent quality',4,00005757),(1013,403,'Exchange','Size too long','Good quality',3,00005858),(1014,404,'-','-','Nice product',5,00005959),(1015,405,'Missing item','Received only 3 chairs','not proper service',2,00005757);
select * from Service;

