use zoho
create *from staff
                  ---------DAY 19()-----------
             --TRIGGERS
--after trigger   ( it displays the  informataion)

select *from staff
create trigger trig_update on staff
after update
as begin
print('your data is succefully updates')
end

update staff set age = 29 where name ='amit'

create trigger trig_in_del on staff
after insert,delete
as begin
print ( 'your data as insertd ir deleted')
end

select *from staff
delete staff where  id = 29

drop trigger trig_in_del

--create  after trigger on delete cpmmand
create trigger tri_del on staff
after delete
as begin
print('your row is deleted')
end

--instead of triiger (it helps to secure data we can't modify data after insertation)
create trigger instrig_upd on staff
instead of update
as begin 
print( 'your data cant update (triger installed0')
end

select *from staff
update staff set id = 29 where id =28  -- (no chanegs because instead  trrigers inserted)


create trigger trig_del on staff
instead of delete 
as begin
print('cannot delete your data')
end

select *from staff

delete staff where id = 28    -- (no chanegs because instead  trrigers inserted)
select *from staff

--We can modify data without dropping triggers
alter table staff disable trigger  trig_del
delete staff where id = 28         --(now it will deletd because triigger is disabled)
select *from staff

--( after work doen again enable trgger)
alter table staff enable trigger  trig_del
delete staff where id = 27          --( now data cannot delete beacuse, we enabled it) 
select *from staff

--note : insted and after triggger on one automatically insetad awil aplly


--dropping triggers
drop trigger [instrig_upd],[tri_del],[trig_del],[trig_update]
