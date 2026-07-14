create database  TCS

use TCS 


create table employee(
empi_id int identity(101,1) primary key,
fname varchar(150) not null,lname varchar(155) not null,
email varchar(150) not null unique,
job_title varchar(150) not null,
department varchar(150),
salary  decimal(10,2) default 30000.00,
hire_date  date not null default convert(date,getdate()),
city varchar(155) )

exec sp_help 'employee'


INSERT INTO employee
(fname,lname,email,job_title,department,salary,hire_date, city)
VALUES
('Aarav', 'Sharma', 'aarav.sharma@example.com', 'Director', 'Management', 180000, '2019-02-10', 'Mumbai'),
('Diya', 'Patel', 'diya.patel@example.com', 'Lead Engineer', 'Tech', 120000, '2020-08-15', 'Bengaluru'),
('Rohan', 'Mehra', 'rohan.mehra@example.com', 'Software Engineer', 'Tech', 85000, '2022-05-20', 'Bengaluru'),
('Priya', 'Singh', 'priya.singh@example.com', 'HR Manager', 'Human Resources', 95000, '2019-11-05', 'Mumbai'),
('Arjun', 'Kumar', 'arjun.kumar@example.com', 'Data Scientist', 'Tech', 110000, '2021-07-12', 'Hyderabad'),
('Ananya', 'Gupta', 'ananya.gupta@example.com', 'Marketing Lead', 'Marketing', 90000, '2020-03-01', 'Delhi'),
('Vikram', 'Reddy', 'vikram.reddy@example.com', 'Sales Executive', 'Sales', 75000, '2023-01-30', 'Mumbai'),
('Sameera', 'Rao', 'sameera.rao@example.com', 'Software Engineer', 'Tech', 88000, '2023-06-25', 'Pune'),
('Ishaan', 'Verma', 'ishaan.verma@example.com', 'Recruiter', 'Human Resources', 65000, '2022-09-01', 'Mumbai'),
('Kavya', 'Joshi', 'kavya.joshi@example.com', 'Product Designer', 'Design', 92000, '2021-04-18', 'Bengaluru'),
('Zain', 'Khan', 'zain.khan@example.com', 'Sales Manager', 'Sales', 115000, '2019-09-14', 'Delhi'),
('Nisha', 'Desai', 'nisha.desai@example.com', 'Jr. Data Analyst', 'Tech', 70000, '2024-02-01', 'Hyderabad'),
('Aditya', 'Nair', 'aditya.nair@example.com', 'Marketing Analyst', 'Marketing', 68000, '2022-10-10', 'Delhi'),
('Fatima', 'Ali', 'fatima.ali@example.com', 'Sales Executive', 'Sales', 78000, '2022-11-22', 'Mumbai'),
('Kabir', 'Shah', 'kabir.shah@example.com', 'DevOps Engineer', 'Tech', 105000, '2020-12-01', 'Pune');


select *from employee

select *from employee where  job_title = 'Jr. Data Analyst'

select distinct department from employee

select *from employee order by salary

select *from employee where job_title like 'jr%'

select *from employee where fname like 'a%'

select *from employee where fname like '[^a]%'

select *from  employee  where fname like '[sd]%'

select top(5)  *from employee

select *from employee where department in('Tech','Management')

select 
    fname , salary,city,
   case 
  when salary >50000 then 'high salary'
  when salary < 35000 then 'low salry'
  else 'error' end as bonus
  from employee



  use tcs

  select fname,lname,department,salary,
  case
  when department in ('Sales','marketing') then salary *0.01 
  when department   = 'tech' then salary*0.12
  else salary*0.05
  end as bonus_slary 
  from employee

  select *from employee

  select department , sum(salary) from employee group by department

  select department,city,sum(salary) from employee group by department,city

  select  city , count(empi_id) from employee group by city having count(empi_id) >2

SELECT
    COALESCE(city, 'Total') AS city,
    SUM(salary) AS total_salary
FROM employee
GROUP BY ROLLUP(city);

select 
coalesce(city,'total') as city,
 count(empi_id) from employee group by rollup(city)




 select *from employee

 select isnull(department,'Total') as deprtment,isnull(city,'total')as city,count(empi_id) as no_of_employee from employee group by rollup(department,city)


 select fname , salary from employee

 where salary > (select avg(salary) from employee)


 select  fname,department, max(salary) from employee group by salary


 select fname,lname,department,empi_id,salary from employee e1 where salary = 
 (select max(salary) from employee e2 
 where e2.department = e1.department)

 select department,max(salary) from employee group by department

 use TCS

 select *from employee

 select department,AVG(salary)  from employee 
 group by department having avg(salary) >90000

 select concat(fname,' ' ,lname) as full_nmae from employee
 select *from employee


 select CONCAT_WS('-',empi_id,fname,lname , email,city,salary) from employee

 select replace(department,'Human Resources','HR') from employee

  select *from employee


  select getdate()

  select  dateadd(DAYOFYEAR,3,getdate())

  select datediff(DAY,GETDATE(),'2005-05-05')

  select *from employee where  month(hire_date) = 5

  select  fname , datediff(year,getdate(),hire_date) from employee   
  
  SELECT 
    Empi_id,
    Hire_Date,
    YEAR(Hire_Date) AS HireYear,
    MONTH(Hire_Date) AS HireMonth,
    DAY(Hire_Date) AS HireDay
FROM 
    Employee

 
 alter table employee add bonus_slary  int 

 select *from employee

 update employee
 set bonus_slary = salary*0.05


alter table employee alter column bonus_slary int  not null

alter table employee add fulname varchar(255) 



UPDATE employee
SET fulname = CONCAT(fname, ' ', lname);

alter table employee  drop column fname,lname

select *from employee




exec sp_rename 'employee.fulname','fullname','column'

alter table employee add  country varchar(50) 

alter table employee add constraint coun default 'INDIA' for country

insert into employee(empi_id,fullname,job_title,department,email,salary)  values (116,'Amar khan','HR','DR','amrkhan@gmail.com',550000)

INSERT INTO employee
( fullname, job_title, department, email, salary)
VALUEs
( 'Amar Khan', 'HR', 'DR', 'amrkhan@gmail.com', 550000);

INSERT INTO employee
(fullname, job_title, department, email, salary, bonus_slary)
VALUES
('Amar Khan', 'HR', 'DR', 'amrkhan@gmail.com', 550000, 50000);

select *from employee

update employee
set country = 'INDIA'
where country is null

alter table employee add constraint nmae unique(fullname)

alter table employee  add  constraint chck check (salary>0)

exec sp_help 'employee'