create database ItVedant1;
use ItVedant1;

create table Student
(Stud_ID varchar (10), Stud_Name varchar (20), Age int, Email varchar (20), Course varchar (20) );
insert into Student values (100, 'Sam', 16, 'sam@gmail.com', 'BSc'), (101, 'John', 21, 'john@gmail.com', 'BCom'), (102, 'henry', 18, 'henry@gmail.com', 'BCom'), (103, 'Saara', 20, 'saara@gmail.com', 'BBI'), (104, 'Ahana', 19, 'ahana@gmail.com', 'BBA'), (105, 'Eva', 21, 'eva@gmail.com', 'BCom') ;

describe Student;
select * from Student;

update Student
set Stud_Name='Bob', Email='bob@gmail.com' where Stud_ID=102;

delete from Student where Stud_ID=100;

alter table Student
add FeesPayment varchar (20);

update Student
set FeesPayment='Paid' where Stud_ID=101;

update Student
set FeesPayment='Pending' where Stud_ID=102;

update Student
set FeesPayment='Pending' where Stud_ID=103;

update Student
set FeesPayment='Paid' where Stud_ID=104;

update Student
set FeesPayment='Paid' where Stud_ID=105;
select * from Student;

alter table Student
modify Stud_Name varchar (10);

describe Student;

create table Posts
(
User_id int, Post_id int, Likes int);

insert into Posts (User_id, Post_id, Likes) values (101,1,10), (101,2,20), (102,3,15), (102,4,25) (103,3,15), (104,4,25);

              #WINDOW FUNCTION
select User_id, Post_id, Likes,
sum(Likes) over(Partition by User_id) 
as User_Total_Likes from Posts;

select Post_id, Likes,
row_number() over(order by Likes desc) 
as row_num from Posts;

select Post_id, Likes,
rank() over(order by Likes desc) 
as row_num from Posts;

select Post_id, Likes,
Dense_Rank() over(order by Likes desc) 
as denserank from Posts;

            #STRING FUNCTIONS
select upper('Sumit');
select concat('ishika',' ','lokhande');
select length('Badminton');

            #DATE FUNCTIONS
select now();                     
select current_timestamp();
select curdate();
select timestampdiff(year,'2005-02-16',curdate());
select date_add(curdate(),interval 5 day);
select date_sub(curdate(),interval 3 day);
select day('2026-07-03');
select month('2026-03-09');
select year('2026-03-09');
select date_add(curdate(),interval 6 month);
select date_add(curdate(),interval 5 year);
select date_sub(curdate(),interval 3 year);
select date_sub(curdate(),interval 2 month);


select left('Hockey', 3);
select right('Chess', 3);
select trim('  Ishika  ');
select reverse('akihsi');
select substring('Hello',3);
select replace('Database','Data','s');

		#MATH FUNCTION
select round(525.456,-4);
select round(555.456,-3);
select round(545.456,-3);
select round(545.675,-2);
select round(525.456,2);

select floor(50.51);
select floor(49.20);
select ceiling(30.10);
select ceiling(40.50);
select abs(-34.56);

select truncate(45.456,1);
select truncate(45.456,-1);
select Post_id, Likes,
ntile(3) over(order by Likes) as total from Posts;

select * from Student;
create table Batch
(ID int, B_id int, B_name varchar (10), Course varchar (20), marks int, DOA date);
select * from Batch;

insert into Batch (id, B_id, B_name, Course, marks,DOA) VALUES (101, 1000, 'KL215' ,'Node JS', 89, '2025-11-23'),(102, 1001, 'KL215' ,'Node JS', 79, '2025-11-23'),(103, 1003, 'KL215' ,'Node JS', 80, '2025-11-23'),
(107, 1003, 'KL215' ,'Node JS', 89, '2025-11-23'),(106, 1004, 'KL215' ,'Node JS', 89, '2025-11-23');

set @Stud_ID =103;
select Stud_Name,Email from Student where Stud_ID =(select ID from Batch where ID =@Stud_ID);

select Stud_Name, Email from Student where Stud_ID=(select max(Stud_ID) from Batch);
select Stud_Name, Email from Student where Stud_ID=(select min(Stud_ID) from Batch);






