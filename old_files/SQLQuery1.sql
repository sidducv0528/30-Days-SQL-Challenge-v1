use zoho
select   *from customer
insert  into customer values (5 ,'ganesh','ram','g5r@gmail.com' ,'lalnagar','sanjose' , 'usa',987654)
insert into  customer(customerid,firstname) VALUES (5,'ganesh'),(4,'vivek')

with dup as(
select ROW_NUMBER() over (partition by firstname order by customerid) as rnk  from customer)
delete from dup
where rnk > 1


wirh dup as(
select row_number() over (partiotaon by first name order by ifd ) as rank fromc utsmer )
delte from dup wherfe trank> 1

sp_rename 'customer.customer.id','id'

sp_rename 'customer.firstname','name'