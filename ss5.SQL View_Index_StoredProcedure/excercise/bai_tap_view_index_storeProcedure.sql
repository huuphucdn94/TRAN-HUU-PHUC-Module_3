create database if not exists product_management;
use product_management;
-- drop product_management;

create table products(
id int primary key auto_increment,
product_code int,
product_name varchar(50),
product_price float,
product_amount int,
product_description varchar(100),
product_status bit
);
insert into products(product_code,product_name,product_price,product_amount,product_description,product_status)
values (100,'e',7,55,'ee',1),(200,'a',11,22,'good',1),(300,'d',32,15,'bad',0),(400,'t',37,93,'nice',1),(500,'s',61,10,'enough',1);

-- INDEX
-- Tạo Unique Index trên bảng Products (sử dụng cột productCode để tạo chỉ mục)
create unique index idx_product_code 
on products(product_code);

-- Tạo Composite Index trên bảng Products (sử dụng 2 cột productName và productPrice)
create index idx_name_product
on products(product_name, product_code);

-- Sử dụng câu lệnh EXPLAIN để biết được câu lệnh SQL của bạn thực thi như nào
explain select * from products 
where product_name = 'd';

-- VIEW
-- Tạo view lấy về các thông tin: productCode, productName, productPrice, productStatus từ bảng products
create view view_products as 
select product_code,product_name,product_price, product_status
from products;

-- Tiến hành sửa đổi view
create or replace view view_products as
select product_code,product_name
from products;

update view_products
set product_name = 'new name'
where product_code = 200;

-- Tiến hành xoá view
drop view view_products;

-- STORED PROCEDURE
-- Tạo store procedure lấy tất cả thông tin của tất cả các sản phẩm trong bảng product
delimiter //
drop procedure if exists view_all//
create procedure view_all()
begin 
select * from products;
end //
delimiter ;

call view_all();

-- Tạo store procedure thêm một sản phẩm mới
delimiter //
drop procedure if exists add_product//
create procedure add_product(
pcode int, pname varchar(50), pprice float, pamount int, pdes varchar(100),pstatus bit
)
begin 
insert into products(product_code,product_name,product_price,product_amount,product_description,product_status)
values (pcode,pname,pprice,pamount,pdes,pstatus);
end//
delimiter ;

call add_product(600,'new product',11,11,'abc',1);

-- Tạo store procedure sửa thông tin sản phẩm theo id
delimiter //
drop procedure if exists edit_by_id//
create procedure edit_by_id(
id int,pcode int, pname varchar(50), pprice float, pamount int, pdes varchar(100),pstatus bit
)
begin 
update products
set product_code = pcode, product_name = pname,product_price = pprice,product_amount = pamount,product_description = pdes,product_status = pstatus
where products.id = id;
end //
delimiter ;

call edit_by_id(5,55,'edit',55,55,'edit',0);

-- Tạo store procedure xoá sản phẩm theo id
delimiter //
drop procedure del_by_id//
create procedure del_by_id(
id int
)
begin
delete from products
where products.id = id;
end//
delimiter ;

call del_by_id(4);