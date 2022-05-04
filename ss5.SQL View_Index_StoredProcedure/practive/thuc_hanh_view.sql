use classicmodels;

create view customer_view as 
select customerNumber,customerName,phone 
from customers;

create or replace view customer_view as
select customerNumber,customerName,contactFirstName,contactLastName,phone
from customers
where city = 'Nantes';