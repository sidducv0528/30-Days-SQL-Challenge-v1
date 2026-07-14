use demo
select *from employee
sp_help 'employee'
update employee set id =1 where name = 'ram'

---- primay key ( automatice sorting order and unoque values and no null value)
alter table employee add constraint pr_key_name primary key(id)
alter table employee  alter  column  id int not null
sp_help 'employee'
select *from employee
