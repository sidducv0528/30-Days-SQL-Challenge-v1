use zoho
select *from staff
             --------DAY 20 ()----------
 --ROW NUMBWR
 SELECT *from staff

 select *, ROW_NUMBER() over (order by id) as roll_no from staff
 select *, ROW_NUMBER() OVER (ORDER BY NAME) AS NAME_ID FROM staff  
 SELECT *, ROW_NUMBER() over (order by department) as dep_id from staff


--partition row number
 select *, ROW_NUMBER() over (partition by department order by department) from staff
 select *, ROW_NUMBER() over (partition by age order by age) from staff


 --CTE
 use zoho
select * from STAFF
insert into staff values (31, 'Karan', 28, 'Male', 39000, 'HR', 'Kolkata', 'India')
select * from staff 

select *, row_number() over (partition by id order by id) as Id_no from staff 
select * from staff 
select * from staff  where name = 'Karan'

delete top(8) from staff  where name = 'Karan'
select * from staff 

insert into staff  values (32, 'Reena', 34, 'Female', 56000, 'HR', 'Delhi', 'India'),
(33, 'Karuna', 56, 'Female', 78000, 'Accounts', 'Mumbai', 'India'),
(34, 'Tim', 45, 'Male', 48000, 'HR', 'San Jose', 'USA'),
(35, 'David', 40, 'Male', 54000, 'IT', 'Moscow', 'Russia')


insert into staff  (id, name, age) values (36, 'Kimoren', 27 ), (37, 'Pawan', 48),
(38, 'Anil', 36), (39, 'Jennifer', 48), (40, 'Ronney', 24)


select * from staff 

select *, row_number() over (partition by id order by id) as Id_no from staff 

--deleting duplicate values
with rabbit as
(select *, ROW_NUMBER() OVER (PARTITION BY ID ORDER BY ID) AS ID_NO FROM STAFF)
DELETE  FROM RABBIT WHERE ID_NO >1

select *from staff

--Transactation in sql
select *from staff

--before tarnscation
update staff set age = 31 where name = 'Amit'
update staff set department = 'HR' where name = 'Anjali'
update staff set city = 'Nagpur' where name = 'Sonam'            --(its excte all  except handling error)
update staff set department = 'Banking' where name = 'Ashish'
update staff set salary = 84000/0 where name = 'Poonam'


update  staff set age = 44 where name = 'Ryan'
update  staff set department = 'HR' where name ='Arun'
update staff set department = 'Accounts' where name ='Shivani'         --(its excte all  except handling error)
update  staff set salary = 50000/0 where name = 'Priya'

--after transaction
begin try
begin transaction
update  staff set age = 45 where name = 'Ryan'
update  staff set department = 'IT' where name ='Arun'
update staff set department = 'Accounts' where name ='Shivani'         --(no changes evem there exist one exptional error)
update  staff set salary = 50000/0 where name = 'Priya'
print('transaction commitd')
end try
begin catch
rollback transaction
print('rollback commited')
end catch

select *from staff


begin transaction       ---(transaction strats from here)
update staff set age = 45 where id = 22      ---(update done)
select *from staff
rollback                  --(we gat back previous value)
update staff set age = 45 where id = 22
commit     --(now it is fixed)