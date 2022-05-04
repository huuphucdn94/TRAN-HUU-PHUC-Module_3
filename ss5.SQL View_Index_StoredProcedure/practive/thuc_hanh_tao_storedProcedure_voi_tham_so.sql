use classicmodels;

-- tham số loại IN
delimiter //
drop procedure if exists get_customer_by_id //
create procedure get_customer_by_id
(in id int)
begin 
select * from customers where customerNumber = id;
end //
delimiter ;

call get_customer_by_id(175);

-- tham số loại OUT
-- ex1:
delimiter //
drop procedure if exists get_customer_count_by_city //
create procedure get_customer_count_by_city(
in in_city varchar(50),
out total int
)
begin
select count(customerNumber)
into total
from customers
where city = in_city;
end //
delimiter ;

call get_customer_count_by_city('Lyon', @total);
select @total;

-- ex2:
delimiter //
drop procedure if exists check_id//
create procedure check_id(
in id int,
out out_id int)
begin
set out_id = (select customerNumber from customers where customerNumber = id);
end //
delimiter ;

call check_id(175,@haha);
select @haha;

-- tham số loại INOUT
delimiter //
drop procedure if exists set_counter//
create procedure set_counter (
inout counter int, 
in inc int
)
begin 
set counter = counter + inc;
end//
delimiter ;

set @counter = 2;
select @counter;
call set_counter(@counter,2);