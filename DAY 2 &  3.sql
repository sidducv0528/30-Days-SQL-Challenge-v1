use zoho
select *from staff

                ------------- day 2 & 3() -----------------
select *from staff
insert into staff values (17,'john',26, 'male',42000,'HR',' Chennai')

--- distinct ( multiples values show has singles value no duplicates)
select *from staff
select distinct *from staff
select distinct department from staff
select distinct age from  staff

--CLONE (we can transfer data has duplicate clone )
select * into  dup  from staff
select *from dup

select   * into clone3 from staff where gender  = 'male' and department = 'HR'
select  distinct *from clone3

select id, name , age into clone4 from staff
select *from clone4


--UPDATE ( update or modify data)
select *from clone4
update  clone4 set  name = 'kittu' where id = 17                           ------ practise------
select *from clone4
select *from dup
update dup  set name = 'don', age = 26 ,gender ='male' where id = 17
select *from dup
update dup set city = '--' where city is null

select *from staff
update staff set age =28 where name = 'amit'                              ---- orginal---------
select *from staff
update  staff set department ='marketting' where name =  'anjali'
update staff  set age = 51, salary= 98000, city = 'ambala' where name = 'romel'
select *from staff
update staff set age = 41 ,salary = 67000, city = 'banglore' where name ='nipun'
select *from staff

--- set null valuse to any value
update staff set age = 38 where age is null
update  staff set city = ' dehardum' where city is null
update staff set  salary = 69000  where salary is null
update staff set city = null where name = 'Rayan'
select *FROM staff

--DELETE ( delete a cloumn ) 
select *from clone
delete from clone where Name = 'Amit'
delete from clone where department = 'marketing'
delete from clone  where gender = 'female'
delete from clone where city is null

--- DELETE DUPLICATE VALUES  n-1
select *from   clone where name = 'john'
delete top(6) from clone where name = 'john'
delete top(4) from clone2 where name = 'john'
delete top(1) from staff where name = 'amit'

-- TRUNCATE (  delete all data inside of table )
truncate table clone3
select *from clone3

--DROP ( deletes all the data )
drop table clone3
drop table dup