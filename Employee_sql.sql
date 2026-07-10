create database ITVedant;
use ITVedant;
create table EmployeeInfo
(
Emp_id int primary key auto_increment, Emp_name varchar (20) not null, Email varchar (40) unique, Salary int check(Salary between 15000 and 80000), City varchar (20) check(City in('Mumbai', 'Pune', 'Nagpur', 'Nashik')), State varchar (20) default 'Maharashtra', created_at datetime default current_timestamp
);
insert into EmployeeInfo(Emp_name,Email,Salary,City) values('Shubhankar','shubhankar@gmail.com', 24000, 'Mumbai');
insert into EmployeeInfo(Emp_name,Email,Salary,City) values('Ishika','ishika@gmail.com', 30000, 'Mumbai'), ('Sanchita', 'sanchita@gamil.com', 28000, 'Pune'),('Sanika', 'sanika@gmail.com', 25000, 'Nashik');
update EmployeeInfo
set  Emp_name='Ahana' where Emp_id=4;
update EmployeeInfo
set Email='ahana@gmail' where Emp_id=4;
select * from EmployeeInfo;
update EmployeeInfo
set City='Pune' where Emp_id=4;
select * from EmployeeInfo;
update EmployeeInfo set Emp_name='John', Email='john@gmail.com', City='Nashik' where Emp_id=1;
select * from EmployeeInfo;
Delete from EmployeeInfo where Emp_id=2;
select * from EmployeeInfo;
set sql_safe_updates = 0;
delete from EmployeeInfo;
insert into EmployeeInfo(Emp_name,Email,Salary,City) values('Shubham','shubham@gmail.com', 24000, 'Mumbai'),('Saara', 'saara@gmail.com', 30000, 'Pune'),('Henry', 'henry@gmail.com', 21000,'Nagpur');
select * from EmployeeInfo;
truncate EmployeeInfo;
insert into EmployeeInfo(Emp_name,Email,Salary,City) values('Adam','adam@gmail.com', 22000, 'Mumbai');


create table EmpInfo
(
Emp_id int, Emp_name varchar (20), Email varchar (40), Salary int, City varchar (20)
);
Describe EmpInfo;
alter table EmpInfo
add constraint pk_id primary key(emp_id);

alter table EmpInfo
modify Emp_name varchar (20) not null;

Describe EmployeeInfo;

alter table EmployeeInfo
add Department varchar (20) not null;

update EmployeeInfo
set Department='Finance' where Emp_id in (1,3);

insert into EmployeeInfo(Emp_name,Email,Salary,City,Department) values('Eva','eva@gmail.com', 26000, 'Pune', 'IT');
insert into EmployeeInfo(Emp_name,Email,Salary,City,Department) values('Sam','sam@gmail.com', 18000, 'Nagpur', 'HR'), ('Steve','steve@gmail.com', 16000, 'Pune', 'Finance'),('Henry','heenry@gmail.com', 16000, 'Pune', 'HR'),('Meghan','meghan@gmail.com', 26000, 'Nashik', 'Finance');
insert into EmployeeInfo(Emp_name,Email,Salary,City,Department) values('Samuel','samuel@gmail.com', 20000, 'Mumbai', 'Admin'),('John','john@gmail.com', 30000, 'Pune', 'Admin');

select Department, sum(Salary) as Total from EmployeeInfo
group by Department order by total desc;

select Department, sum(Salary) as Total from EmployeeInfo
group by Department;

select Department, avg(Salary) as Total from EmployeeInfo
group by Department;

select Emp_name,Salary, avg(Salary) over() as average_salary from EmployeeInfo;

select Emp_name, Salary, row_number() over(order by Salary desc) as row_num from EmployeeInfo;

select Emp_name, Department, Salary, avg(Salary) over(partition by Department) as dept_avg from EmployeeInfo;

select Emp_name, Salary, rank() over(order by Salary desc) as row_num from EmployeeInfo;

select Emp_id, Emp_name,Department, Salary,Dense_rank() over(order by Salary desc) as DenseRank from EmployeeInfo;

select * , count(*) over () as employee_count from EmployeeInfo;

select *, if(Salary>20000, 'GOOD','AVERAGE') from EmployeeInfo;

          #COMPARISON FNS
select greatest(10,30,5);
select least(6,34,2);
select ifnull(null,3);
select nullif(15,15);
select coalesce(null,null,0,30);

alter table EmployeeInfo
add ManagerID int;
select * from EmployeeInfo;

update EmployeeInfo set ManagerID=null where Emp_id=1;
update EmployeeInfo set ManagerID=1 where Emp_id=2;
update EmployeeInfo set ManagerID=1 where Emp_id=3;
update EmployeeInfo set ManagerID=2 where Emp_id=4;
update EmployeeInfo set ManagerID=3 where Emp_id=5;
update EmployeeInfo set ManagerID=3 where Emp_id=6;
update EmployeeInfo set ManagerID=4 where Emp_id=7;
update EmployeeInfo set ManagerID=5 where Emp_id=8;

select e.Emp_name as Employee, e1.Emp_name as Manager from EmployeeInfo e join EmployeeInfo e1 on e.ManagerID= e1.Emp_id;

select * from EmployeeInfo;

alter table EmployeeInfo
add DeptID int;

update EmployeeInfo set DeptID = 1 where Department='Finance';
update EmployeeInfo set DeptID = 2 where Department='IT';
update EmployeeInfo set DeptID = 2 where Department='HR';
update EmployeeInfo set DeptID = 3 where Department='Finance';
update EmployeeInfo set DeptID = 4 where Department='HR';
update EmployeeInfo set DeptID = 5 where Department='Finance';
update EmployeeInfo set DeptID = 5 where Department='Admin';
update EmployeeInfo set DeptID = 6 where Department='Admin';

create table Departmentss
(DeptID int, Dept_name varchar (10) );

insert into Departmentss (DeptID, Dept_name) values (1,'Finance'),(2,'IT'),(3,'HR'),(4,'Finance'),(5,'HR'),(6,'Finance'),(7,'Adnin'),(8,'Admin');

select d.DeptID, d.Dept_name from Departmentss d left join EmployeeInfo e on d.DeptID = e.DeptID where e.Emp_id is null;



























