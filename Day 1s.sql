                             ------ day 1 ------------
-- create  a database
create database zoho

-- use  ( database to accesse it )
use zoho

-- create a table 
create table staff
(Id int, Name varchar(250), age int , Gender varchar(250) , salary int, department varchar(250), city varchar(250))

select *from staff

                    ---------- day 2 -------------
--inserting values to data
insert into staff values (1,'Amit',29,'Male',56000,'IT','Delhi'),(2,'Anjali',30,'Female',60000,'HR','Mumbai'),
(3,'Sonam' ,35,'Female',72000,'Accounting','Pune'),
(4,'Ashish',40,'Male',80000,'Marketing','Chennai'),
(5,'Poonam',41,'Female',82000,'IT','Pune'),
(6,'Rayan',42,'Male',45000,'Marketting','Bangalore'),
(7,'Arun',25,'Male',62000,'Acoounting','Jaipur'),
(8,'Shivani',29,'Female',45000,'IT','Agra'),
(9,'Priya',31,'Female',49000,'HR','Bhopal'),
(10,'Ajay',35,'Male',62000,'IT','Indore'),
(11,'Vijay',40,'Male',65000,'HR','Ajmer'),
(12,'Meenu',39,'Female',45000,'Accounts','Lucknow')
select *from staff

--insert partial values ( only we insert known or needed VALUES , reaming values fill with null)
insert into staff(id ,Name , Gender , department) values 
(13,'Romel','Male','IT'),(14,'Nipun','Male','Marketing'),(15,'simran','Female','HR'),
(16,'Javed','Male','Accounts')
select *from staff

--select (what we need  from the table)
select id , name from staff
select name , department from staff
select name from  staff

---WHERE ( selecting particular group)
select *from staff where gender =  'Female'
select *from staff  where department = 'HR'
select *from staff where city =  'delhi'
select *from  staff where age = 35

--TOP ( PICKUPING TOP MEMBERS )
select *from staff
select top(5) *from staff  
select top(3) name  from staff
select top(4) id from staff
select top(6) id ,name, department from staff



               