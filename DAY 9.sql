use zoho
select *from staff
insert into staff values(17,'dimple',49,'female',87000,'HR','paniput','India')

              -------------DAY 9()--------------

--4 . UNIQUE (in this constraint all values are present in unique no duplicates and its allow only one null value)
alter table staff add constraint unq_id unique(id)   --(error because dupicate value is there , unique consider only uniuye values)
update staff set id = 25 where name = 'dimple'
alter table staff add constraint unq_id unique(id)   --(now its runs because all are uniue values are there)
sp_help 'staff'

update staff set id = 10 where name = 'arun'  --(eroor due to unique constraint)
insert  into staff(name,age,salary,gender ,department) values ('varun',25,45000,'male','IT') ---( in unq constraint only one null valule)

insert  into staff(name,age,salary,gender ,department) values ('gopal',25,45000,'male','IT') --(it will not insert beacuse alredy null value created before)
select *from staff
sp_help 'staff'

-- dropping constraint
alter table staff drop constraint unq_id

---4    primary key constraint(its is no null and unique values and we can add one constraint whole table)
select *from staff
alter table staff alter column id int not null
update staff set id = 26 where name = 'varun'
alter table staff alter column id int not null
sp_help 'staff'

--primary key
alter table staff add constraint primary_id primary key(id)
select *from staff
alter table staff  alter column name varchar(250) not null  
alter table staff add constraint  pri_name primary key(name)  -- ( in this primaryr constraint i sorted ayutomatic)
select *from staff
sp_help 'staff'

--dropping constraint 
alter table  staff drop constraint pri_name
