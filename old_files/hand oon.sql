use demo

-- NVarchar and Nchar.
varchar - ASCII(A,B,&,7)
create table VARCHAR_X(Name varchar(30))
insert into VARCHAR_X values('Jay')
insert into VARCHAR_X values('??')
select * from VARCHAR_X

--Nvarchar :- UNICODE
create table NVARCHAR_X(Name Nvarchar(30))
insert into NVARCHAR_X values('Jay')
insert into NVARCHAR_X values('??')
insert into NVARCHAR_X values(N'??')
select * from NVARCHAR_X
insert into NVARCHAR_X values(N'???')


 /* Create a customer table which comprises of these columns: ‘customer_id’,
‘first_name’, ‘last_name’, ‘email’, ‘address’, ‘city’,’state’,’zip’ */
-- Insert 5 rows into the customer table

--Select only the ‘first_name’ and ‘last_name’ columns from the customer table
---Select those records where ‘first_name’ starts with “G” and city is ‘SanJose’. 
---Select those records where Email has only ‘gmail’. 
---Select those records where the ‘last_name’ doesn't end with “A”.


create table customer_table
(customer_id int, first_name varchar(250), last_name varchar(259),email varchar(250), address varchar(250),city varchar(250),
state varchar(250),zip int)

insert into customer_TABLE values
(1, 'Gaurav', 'Mehta', 'gaurav@gmail.com', 'MG Road', 'SanJose', 'CA', '95112'),
(2, 'Rohan', 'Sharma', 'rohan@yahoo.com', 'Park Street', 'Delhi', 'DL', '110001'),
(3, 'Geeta', 'Verma', 'geeta@gmail.com', 'Lake View', 'SanJose', 'CA', '95110'),
(4, 'Amit', 'Kapoor', 'amit@gmail.com', 'Hill Road', 'Mumbai', 'MH', '400001'),
(5, 'Gopal', 'Singh', 'gopal@hotmail.com', 'Ring Road', 'Jaipur', 'RJ', '302001')

select  *from customer_table
select first_name, last_name from customer_table
select *,concat(first_name,'   ' ,last_name) from customer_table
select * from customer_table where first_name like 'G%' and city = 'SanJose' 
select  *,email from customer_table where email like ('%gmail.COM')
select last_name from customer_table where  last_name not like ('%A')



/*Create a customer_X table which comprises of these columns: ‘customer_id’,
‘first_name’, ‘last_name’,'phone number'*/

--2. Insert 5 new records into the table

--Create an ‘Orders’ table which comprises of these columns: ‘order_id’,
--order_date’, ‘amount’, ‘customer_id’.

--Insert 5 new records.
--Make an inner join on ‘Customer’ and ‘Orders’ tables on the ‘customer_id’ column.

-- Make left joins on ‘Customer’ and ‘Orders’ tables on the‘customer_id’ column

--Make right joins on ‘Customer’ and ‘Orders’ tables on the‘customer_id’ column

--Make a full outer join on ‘Customer’ and ‘Orders’ table on the ‘customer_id’ column.


 -- create customer_X table
create table customer_X (
customer_id int,
first_name varchar(50),
last_name varchar(50),
phone_number varchar(15)
);

-- insert 5 records into customer_X
insert into customer_X values
(1,'rahul','sharma','9876543210'),
(2,'priya','verma','8765432109'),
(3,'amit','singh','9854321098'),
(4,'neha','patel','9543210987'),
(5,'rohit','mehta','6332109876');

-- create Orders table
create table Orders (
order_id int,
order_date date,
amount decimal(10,2),
customer_id int
);

-- insert 5 records into Orders
insert into Orders values
(101,'2026-01-01',2500.00,1),
(102,'2026-01-05',1500.00,2),
(103,'2026-01-10',3200.00,3),
(104,'2026-01-15',4500.00,4),
(105,'2026-01-20',2800.00,5);

-- inner join Customer_X and Orders on customer_id
select  *from customer_X c inner join Orders o
on c.customer_id = o.customer_id;

-- left join Customer_X and Orders on customer_id
select *from customer_X c
left join Orders o
on c.customer_id = o.customer_id;

select  *from customer_table t 
full join Orders o
on t.customer_id = o.customer_id;
