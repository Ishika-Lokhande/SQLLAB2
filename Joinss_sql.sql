create database Joinss;
use Joinss;
create table TABLE1
(ID int, Name varchar (20) );
insert into TABLE1(ID, Name) values (1,'Ahana'),(2,'Sam'),(3,'John'),(5,'Steve'),(6,'Smith');
select * from TABLE1;

create table TABLE2
(ID int, Email varchar (20) );
insert into TABLE2(ID, Email) values (1,'ahana@gmail.com'),(2,'sam@gmail.com'),(3,'john@gmail.com'),(7,'steve@gmail.com'),(8,'smith@gmail.com');
select * from TABLE2;

create table Tablee3
(C_ID int, C_Name varchar (20) );
insert into Tablee3(C_ID, C_Name) values (1,'BSc'),(2,'BCom'),(3,'BMS'),(9,'BBI'),(10,'BAF');
select * from Tablee3;

create table TABLE4
(C_ID int, T_ID int, Marks int);
insert into TABLE4(C_ID,T_ID, Marks) values (1,100,56),(2,101,67),(3,102,89),(11,103,79),(12,104,78);
select * from TABLE4;

select Name ,Email, C_Name, Marks
from TABLE1 INNER JOIN TABLE2 ON TABLE1.ID = TABLE2.ID INNER JOIN Tablee3 ON TABLE2.ID = Tablee3.C_ID INNER JOIN TABLE4 ON Tablee3.C_ID = TABLE4.C_ID;

select Name ,Email, C_Name, Marks
from TABLE1 LEFT JOIN TABLE2 ON TABLE1.ID = TABLE2.ID LEFT JOIN Tablee3 ON TABLE2.ID = Tablee3.C_ID LEFT JOIN TABLE4 ON Tablee3.C_ID = TABLE4.C_ID;

select Name ,Email, C_Name, Marks
from TABLE1 RIGHT JOIN TABLE2 ON TABLE1.ID = TABLE2.ID RIGHT JOIN Tablee3 ON TABLE2.ID = Tablee3.C_ID RIGHT JOIN TABLE4 ON Tablee3.C_ID = TABLE4.C_ID;

select Name ,Email, C_Name, Marks
from TABLE1 CROSS JOIN TABLE2  CROSS JOIN Tablee3  CROSS JOIN TABLE4 ;

select Name ,Email, C_Name, Marks
from TABLE1 NATURAL JOIN TABLE2  NATURAL JOIN Tablee3  NATURAL JOIN TABLE4 ;

select e.ID , e.Name as NAME, e1.Name as New_name from TABLE1 e JOIN TABLE1 e1 on e.ID = e1.ID;






