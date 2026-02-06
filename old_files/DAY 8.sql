use zoho
select *from staff
                 -----------DAY 8 ()-----------
--- WE CAN ADD CONSTRAINTS BEFORE CREATING A TABLE
create table student
(SID int  not null ,name varchar(250),marks int ,subject varchar(250) not null,
sports varchar(250),constraint  sports check(sports in( 'badmintation','cricket','soccer','table tennis')))

select *from student
insert into student values (1,'john',89,'science','badmintation'),
(2,'sherry',78,'english','table tennis'),(3,'joseph',59,'history','cricket')

insert into student values(4,'kenii','bio','volley ball')       -- errror due to wrong value ineserted

---- 3 DEFAULT CONTRAINT ( it stores the values if we entered null data by add default consraint0
-- note : it leaves previous defalut its starts the where we give defalut function
insert into staff(id,name,age,gender,salary,department) values(22,'rinku',47,'male',47000,'accounting')  -- before default constraint
select *from staff
alter table staff add constraint df_c default 'India' for country
insert into staff(id,name,age,gender,salary,department) values(23,'mohit',36,'male',59000,'marketting')  -- after  default constraint
select *from staff
-- above we not enetred data of country automatic it taken india this is use of defalut constraint 

insert into staff values(24,'rambo',35,'male',50000,'IT','auckland','newzaland')  -- it can insert own valuese also by giving data 
select *from staff


sp_help 'staff'
alter table staff drop constraint df_c