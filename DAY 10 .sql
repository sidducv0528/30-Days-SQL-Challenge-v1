         ----------DAY 10  () -----------------
USE ZOHO
----FOREIGN KEY ()
select *from staff         ----(pk on ID COLUMN)parent 
select *from project
alter table project add constraint for_key foreign key(pid) references staff(id)
sp_help 'project'

select *from  staff     --------(PK on ID column parent)
select *from project    --------(FK on ID column reference id , child class)

insert into project values ( 27,'jersing','testing',5826)   ---(error because parent have only 26 rows)
insert into  staff values (27,'madhu',59,'male',89000,'HR','banglore','India')  -- (updates 27 row data)
insert into project values ( 27,'jersing','testing',5826)  ---(now no error because parent  class have 27 values)
select *from project

--mote we cannnot delete primary key value which present in foreignkey
-- after deleting foreign key value , we can delete the primary key
delete staff where id = 10  -- ( it can't delete because value 10 present in foreign key)

--now 
delete from project where pid  = 10
delete staff where id = 10  --- ( now it is deleted)
select *from staff
select *from project


--dropping constraint
-- we cannot drop frst primary key  frst , fst  drop yhe  foreign key and next drop the primary key
sp_help 'project'
alter table project drop constraint for_key
sp_help 'staff'
alter table staff drop constraint primary_id
