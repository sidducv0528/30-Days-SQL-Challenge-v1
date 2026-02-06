-- Day 02: INSERT & SELECT (Zoho SQL)

select * from staff;

-- Insert single row
insert into staff values
(17,'John',26,'Male',42000,'HR','Chennai');

-- Select queries
select * from staff;
select id, name from staff;
select name, department from staff;

-- Filter examples
select * from staff where department = 'HR';
select * from staff where gender = 'Male';
