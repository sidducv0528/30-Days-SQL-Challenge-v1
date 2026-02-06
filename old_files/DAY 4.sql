use zoho	
select *from staff
					-------------------- day 4 ()-----------------------------

---alter  ( add and removing new cloumn )
alter table staff add country varchar(255)
alter table staff add email varchar(255),phone int
select *from staff

-- alter drop ( mention cloumn )
alter table staff drop column email, phone
select *from staff
update staff set country = 'INDIA' where country is null


---- TEMP TABLES ( its crete the table tempory but not save in memory)
create table #school
(name varchar (259) , class int)
select *from #school
insert into #school values ( 'siddu', 10),('kittu',10)

-- temp files also we can  clone..
select * into school1  from #school

---ALIAS ( rename the cloumn name has a tempory show )
select *from  staff
select id as roll_no from staff
select name as shortname , city as location  from  staff

--- rename a cloumn 
sp_rename 'staff.name','firstname'
sp_rename 'staff.firstname','name'
