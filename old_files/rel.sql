CREATE TABLE Customers ( 
    customer_id INT IDENTITY(100,1) PRIMARY KEY, 
    customer_name VARCHAR(100) NOT NULL, 
    email VARCHAR(100) UNIQUE 
);



CREATE TABLE Orders ( 
    order_id INT IDENTITY(500,1) PRIMARY KEY, 
    order_date DATE NOT NULL, 
    total_amount DECIMAL(10, 2), 
    customer_id INT, 
    FOREIGN KEY (customer_id) REFERENCES Customers(customer_id) 
);



INSERT INTO Customers (customer_name, email) 
VALUES 
('Raju', 'raju@example.com'), 
('Sham', 'sham@example.com'), 
('Baburao', 'baburao@example.com');

INSERT INTO Orders (order_date, total_amount, customer_id) 
VALUES 
('2025-09-15', 1500.00, 100), -- This links to Raju (customer_id 100) 
('2025-09-28', 800.00, 101), -- This links to Sham (customer_id 101) 
('2025-10-05', 2200.00, 100), -- This links to Raju (customer_id 100) 
('2025-10-12', 500.00, 102), -- This links to Baburao (customer_id 102) 
('2025-10-17', 1200.00, 101); -- New order for Sham (customer_id 101)


select *from Customers
select *from Orders



select  *from Orders t1 cross join Customers t2

select t1.customer_name ,t2.order_id ,sum(t2.total_amount) from Customers t1 inner join orders t2
on  t1.customer_id = t2.customer_id group by t1.customer_name


create view total_amt as
SELECT t1.customer_name,
       SUM(t2.total_amount) AS total_amount
FROM Customers t1
INNER JOIN Orders t2
ON t1.customer_id = t2.customer_id
GROUP BY t1.customer_name;

select *from total_amt



use TCS

select *from employee

select FUllname , sum(salary) over() as Total_salary ,
cast(salary*100/ sum(salary) over() as  decimal(10,2))
from employee

select fullname,department,
sum(salary) over(partition by department) from employee


--rownumber
select row_number() over(order by salary desc),salary,



fullname from employee

select fullname ,department,salary,
rank() over(order by salary) from employee

select fullname ,salary,
lag(salary) over(order by salary) from employee

select fullname, department,salary,
DENSE_RANK() over(partition by department order by salary) from employee


select fullname,department,salary,
ntile(3) over(order by salary) from employee

select *from employee where  salary >(
select department,avg(salary) from employee group by department)

SELECT department,
       AVG(salary) AS avg_salary
FROM employee
GROUP BY department
HAVING AVG(salary) > 90000;


SELECT *
FROM employee e
WHERE salary > (
    SELECT AVG(salary)
    FROM employee
    WHERE department = e.department
);



with  max_sal as(
select department,max(salary) as max_salary from employee group by department)
select fullname,e1.department,salary, max_salary from employee e1
join max_sal e2 on  e1.department = e2.department
where


CREATE PROCEDURE Hike
AS
BEGIN
    SELECT *,
           (salary * 1.15) AS new_salary
    FROM  employee;
END;
GO

exec dbo.Hike


use TCS
create index s_no on employee(empi_id)

with dup as(
select *from employee 