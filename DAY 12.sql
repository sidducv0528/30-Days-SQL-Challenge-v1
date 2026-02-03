use zoho
select *from staff
            ----------------- DAY 12 () ----------------------------
--- USER DEIFINED FUNCTIONS
create function multiply
( @a int ,@b int , @c int )
returns int
as begin 
return @a * @b * @c
end
select dbo.multiply( 15,20,5) as output
select dbo.multiply(55,5,3)


create function addition
(@a float , @b float , @c float)
returns float
as begin
return @a + @b + @c
end 
select dbo.addition(50.3,55.34,96.386)
select dbo.addition(10,563,50)


--- we need change into 3 multiple to 4 multiple
sp_helptext 'multiply'
alter  function multiply  
( @a int ,@b int , @c int, @d int )  
returns int  
as begin   
return @a * @b * @c * @d
end  
select dbo.multiply(1,5,3,6)

create function opertaions
(@a float , @b float , @c float)
returns float
as begin
return @a * @b + @c
end 
select dbo.addition(50.3,55.34,96.386)
select dbo.addition(10,563,50)

----    user definedfunction 2
create function  SI
(@a int , @b int , @c int )
returns float
as begin 
return (@a * @b * @c ) /100
end

select dbo.SI(100,2,3)
select *from staff

select name , salary as principal,  age as  ROI ,id as time ,  dbo.si(salary,age,id) from staff
select dbo.si(salary,age,id) from staff