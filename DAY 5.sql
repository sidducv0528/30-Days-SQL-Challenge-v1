-------------------day 5 -----------------
use zoho
select *from staff

------OPERATORS-------
-- AND ( both conditions should be true)
select *from  staff where gender = 'male' and department ='it'
select *from staff where Gender = 'female' and department = 'hr'

--OR ( in both conditions satisfy any 1 condition )
select *from staff where gender = 'male'or department= 'it'
select *from staff where gender = 'female' or department = 'hr'

--- NOT ( opoosiete or except )
select *from staff where not gender = 'male'
select *from staff where not  department = 'it'
select *from staff where  gender != 'male'
select *from staff where gender <>  'male'

---------------operataors and claueses-------------

--intersect  ( similar to 'AND')
select *from  staff where gender = 'male'
intersect
select *from staff where department = 'it'

--UNION (  similar to 'OR'  but it  doesn't allow duplicates or repeated values
select *from  staff where gender ='female'
union 
select *from staff  where department = 'hr'

-- UNION ALL (  similar to union but it  allow duplicates or repeated values )
 select * from staff where gender = 'female'
 union all
 select *from staff  where department = 'hr'  

---- EXCEPT ( A - B )
 select *from staff  where gender = 'female' 
 except
 select *from staff department where department = 'it'

 ----LIKE (  searchimg name with letter )
 select*from staff where name like ('a%')   --- searching  staring lettrer with ' A'
 select *from staff where name like ('%a')  ---- seraching end with letter with 'A'
 select *from staff where name like ('_%a')  ----  seraching start with second letter with 'a'
select *from staff where name like('__%a')   --- seraching start with third letter with "A"
select *from staff where name like  ('__%a') ----- seraching third last lettter with "A"
select *from staff where name like ('%ni')
select *from staff where name like ('a%h')  ---- seraching serach frst nd last letter
select *from staff where name like ('%a%')  -- seraching  all word with letter 'a'
select *from staff where  age like ('%2')

select *from staff where name not like ('%a%')  -- comes name without letter "A'
select *from staff where name like  '[a,j,s]%'  --- searching with  multiple staring  letters