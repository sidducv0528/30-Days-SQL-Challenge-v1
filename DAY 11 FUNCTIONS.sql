
           ------------day 11 and 12 ()-----------------
-- SYSTEM FUNCTIONS
use zoho
select *from staff

---- SUM 
select sum(salary) as total_salary from staff

--MIN
select min(age) as min_age from staff

--MAX 
  select max(age) as max_age from staff

--AVG
select avg(salary) from staff

select  department,avg(age)   as avg_age  from staff group by department

--COUNT
select count(*) from staff
select count(name) from staff
select count(city) from staff
select count(distinct(department))  from staff
select count(distinct(city)) from staff
select gender , count (*)  from staff  group by gender
select city ,count(*) from staff group by city

--SYSTEM FUNCTION 2 
--UPPER 
select upper(name) from staff

--LOWER
select LOWER(name) from staff

--REVERSE
select REVERSE(NAME)from staff
select upper(reverse(name))from staff
select lower(reverse(name)) from staff

select lower(name) as lower_name, upper(name) as upper_name ,lower(reverse(name)) as lr_name ,upper(reverse(name)) as ur_name from staff

--CONCAT
select concat(id,name,age,gender,salary,department,city,country) from staff
select concat(id,' ',name, ' ',age,' ',salary, ' ' , department, '  ') from staff
select concat( id, ':',name , ' ') from staff

select concat(' id: ' , id , 'NAME... ' , NAME, 'AGE= ' , AGE  ,'LOC IS : ' ,CITY, ' ROLE IS " ', DEPARTMENT , ' SALARY = ' , SALARY ) AS INFROMATIOM
FROM STAFF

--REPLACE 
select *from staff
select replace('this is python demo','python','sql')
select *, replace(department,'acoounts','hr') as updated_role from staff
select id ,name,replace(department,'hr','it') as  udate_data from staff

--LENGTH
select name ,  len(name) from staff
select  name ,len(name) , department , len(department) , salary , len(salary) from staff

--SUBSTRING ( space also coount as value)
select substring('this is my  SQL',1,4) 
select SUBSTRING(' this is demo',1,4)
select SUBSTRING('this is the month of jan',13,5)

select name,substring(name,1,3) as intial_letter from staff
select name,upper(substring(name,1,3)) as upp_int_let from staff

/* Generate the default Username and Password for all the employees in below format
Username( First three letters of name in capital + first two letters of gender in lower +
first two letters of department in capital + first three letters of city in capital )
Password ( First letter of name in capital + age + first three letters of gender in lower +
first letter of department in capital + first four letters of city in lower + @ +
first letter of country in capital ) */

select name ,concat(upper(substring(name,1,3)),lower(substring(gender,1,2)),upper(substring(department,1,2)),
upper(substring(city,1,3))) as username ,
concat(upper(substring(name,1,1)),age,lower(substring(gender,1,3)),upper(substring(department,1,1)),lower(substring(city,1,4)),
'@',upper(substring(country,1,4))) as password from staff
