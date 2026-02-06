-- INDEX
use zoho
select *from staff

--without index
select *from staff where city='chennai'           ---(in this its search all 26rows)

--with index
create index ind_city on staff(city)
select *from staff where city = 'chennai'         --(in this its search only 3 rows)

--INDEX ARE TWO TYPES
--1. NON - CLUSTERED ( the above one also non cluster)
create nonclustered index  in_dp on staff(department)
select *from staff where department = 'accounts'
select *from staff
sp_helpindex 'staff'

--2.CLUSTERED INDEX
SELECT  *from staff
alter table staff alter column id int not null
alter table staff add constraint pr_id primary key(id)   -- (by installing primary automatic set into clusstered)
sp_helpindex 'staff'

alter table staff drop constraint pr_id

--cluster index
create clustered index clu_name on staff(name)
select *from staff         --( in clusstered index after installation it sort in automatically in asecdnding order)
drop index  staff.clu_name
create clustered index clu_id  on staff(id)

