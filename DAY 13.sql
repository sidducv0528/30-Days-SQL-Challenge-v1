use zoho
select *from staff
               ----------------- DAY 13 () -----------------------
---JOINS -----
use zoho
select *from staff
select *from project
insert into project values(28,'kopel','sql',2456),(29,'mellot,','aws',7854),(30,'swifter','python',2589)

---1. INNER JOIN (  it extracts only  common values in both tables )
select *from staff  inner join project on  staff.id = project.pid
select *from staff s inner join project p on s.id = p.pid

select s.id , s.name , s.age , s.salary , s.department , p.project_name , p.technology
from staff s inner join project p on  s.id = p.pid                                             --- s and p are not neccessary

select s.id , s.name , s.age , s.salary , s.department , p.project_name , p.technology
from staff s inner join project p on  s.id = p.pid  where p.technology = 'sql'                   --- s and p are not neccessary


select s.id , s.name , s.age , s.salary , s.department , p.project_name , p.technology
from staff s inner join project p on  s.id = p.pid  where p.technology = 'sql'  order by department   

select  id ,name , age, salary , department , project_name , technology 
from  staff s  inner join project p on s.id = p.PID

select technology , avg(salary) as avg_salary from staff s inner join project p on s.id = p.pid group by technology


-- 2 . FULL JOIN ( it extracts the all values froom both tables , which value are not present its fill with null)
select *from staff s  full join  project p on s.id = p.PID
select name , department , project_name , technology from staff s  full join project p on s.id = p.pid

-- 3 . RIGHT JOIN ( it takes max values right  and left values remaing stores as null)
select *from staff s  right join   project p on s.id = p.PID

-- 4 . LEFT JOIN ( it takes max values LEFT   and RIGHT values remaing stores as null )
select *from staff s  LEFT  join   project p on s.id = p.PID

--5. CROSS JOIN (CARTESION PRODUCT, A * b)
select *from staff            ---26 rows
                                                          -- cross join (  26 * 19 = 468 rows)
select *from project          -- 19  rows

select *from staff s cross join project p 
select *from staff s cross join project p order by id  
