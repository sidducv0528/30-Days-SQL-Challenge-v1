use zoho
select *from staff
insert into staff values ( 19,'deepika',7,'female',55000,'marketing','chennai','India')

             ------DAY 7 () -------------
----CONSTRAINTS ()
insert into staff (name, age, gender, salary, department) values
('Shashank', 56, 'Male', 180000, 'IT')

--  1. NOT NULL ( it doesn't allow null values) 
alter table employee alter  column id int not null  ---( it gives msg beacuse  above table have null values)
select *from staff

update  staff set id = 18 where name = 'Shashank'  -- ( now no null values)

alter table staff alter column id int not null ---(now it setted to all id's should be a value)
sp_help 'staff'

insert into  staff (name, age, gender, salary , department) values 
('Jeet', 28, 'Male', 48000, 'HR')                                    ----( error because null values not allowed)
update staff set id = null where id = 2 

alter table staff alter column name varchar(255) not null
sp_help 'staff'




---2. CHECK CONSTRAINT(

alter table staff add constraint  chck_age check(age < 100)
alter table staff add constraint check_age check ( age between 22 and 60)

update staff set age = 37  where name = 'deepika'
select *from staff
update staff set age = 37  where name = 'deepika'

select distinct department from staff
alter table staff add constraint chk_dep check(department in('marketting','Marketing','IT','HR','Acoounting','Accounts','Accounting'))
-- abov one helps in only fill the table above role in department

sp_help 'staff'

insert into staff values
(20,'jenny',45,'female',58000,'banking','oslo','norway')    --( gives error bcoz we fixed constraint for department )


--DROPIING OR REMOVING ALL CONSTRAINTS
alter table staff drop constraint  chck_age 
alter table staff drop constraint  check_age
alter table staff drop constraint chk_dep

-- removing nullable 
alter table staff alter column id int  null
alter table staff alter column name varchar(250) null

sp_help 'staff'
