-- Day 02: INSERT, SELECT, WHERE, DISTINCT
-- Database: SQL Server (SSMS)
-- Table: staff
-- Description: Practiced basic DML operations and filtering


-- Day 02: Insert, Select, Where, Top
-- Inserting values into staff table
insert into staff values
(1,'Amit',29,'Male',56000,'IT','Delhi'),
(2,'Anjali',30,'Female',60000,'HR','Mumbai'),
(3,'Sonam',35,'Female',72000,'Accounting','Pune'),
(4,'Ashish',40,'Male',80000,'Marketing','Chennai'),
(5,'Poonam',41,'Female',82000,'IT','Pune'),
(6,'Rayan',42,'Male',45000,'Marketing','Bangalore'),
(7,'Arun',25,'Male',62000,'Accounting','Jaipur'),
(8,'Shivani',29,'Female',45000,'IT','Agra'),
(9,'Priya',31,'Female',49000,'HR','Bhopal'),
(10,'Ajay',35,'Male',62000,'IT','Indore'),
(11,'Vijay',40,'Male',65000,'HR','Ajmer'),
(12,'Meenu',39,'Female',45000,'Accounts','Lucknow');

-- Insert partial values
insert into staff (id, name, gender, department) values
(13,'Romel','Male','IT'),
(14,'Nipun','Male','Marketing'),
(15,'Simran','Female','HR'),
(16,'Javed','Male','Accounts');

-- Select queries
select * from staff;
select id, name from staff;
select name, department from staff;

-- Where clause examples
select * from staff where gender = 'Female';
select * from staff where department = 'HR';
select * from staff where city = 'Delhi';
select * from staff where age = 35;

-- Top clause examples
select top (5) * from staff;
select top (3) name from staff;
select top (6) id, name, department from staff;
