           ----------DAY 11 ------------
---IMPORTING FILES IN  TWO WAYS 
-- FIRST WAY
use zoho
create table college 
( id int , lastname varchar(250),firstname varchar(250) , middlename varchar(250),suffix varchar(250))

bulk insert dbo.college
from 'C:\Users\vsidd\Downloads\Tiger (2).csv'
with 
(
format = 'csv',
firstrow = 2 )
select *from college

---partial insert data from csv 
create table office
( id int , lastname varchar(250),firstname varchar(250) , middlename varchar(250),suffix varchar(250))

bulk insert dbo.office
from 'C:\Users\vsidd\Downloads\Tiger (2).csv'
with 
( format = 'csv',
firstrow = 7,
lastrow = 20)

--method 2

--step 1 slect databs 
--right cluck on database and select task
-- select imprt file
-- select path , file name , range , customatization
--import
