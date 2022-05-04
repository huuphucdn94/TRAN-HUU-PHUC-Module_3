use quan_ly_ban_hang;
insert into customer (customer_id, customer_name, customer_age) 
value (1,"Minh Quan", 10);
insert into customer (customer_id, customer_name, customer_age) 
value (2,"Ngoc Oanh", 20);
insert into customer (customer_id, customer_name, customer_age) 
value (3,"Hong Ha", 50);
select*from customer;

insert into `order`(order_id, customer_id, order_date, order_total_price)
value (1, 1, '2006-03-21', null);
insert into `order`(order_id,customer_id,order_date,order_total_price)
value (2, 2, '2006-03-23', null);
insert into `order`(order_id,customer_id,order_date,order_total_price)
value (3, 1, '2006-06-13', null);
select*from `order`;

insert into product (product_id, product_name, product_price)
value (1, 'May Giat', 3);
insert into product (product_id, product_name, product_price)
value (2, 'Tu Lanh', 5);
insert into product (product_id, product_name, product_price)
value (3, 'Dieu Hoa', 7);
insert into product (product_id, product_name, product_price)
value (4, 'Quat', 1);
insert into product (product_id, product_name, product_price)
value (5, 'Bep Dien', 2);
select*from product;

insert into order_detail (order_id, product_id, oder_quantity)
value (1,2,3);
insert into order_detail (order_id, product_id, oder_quantity)
value (1,3,7);
insert into order_detail (order_id, product_id, oder_quantity)
value (1,4,2);
insert into order_detail (order_id, product_id, oder_quantity)
value (2,1,1);
insert into order_detail (order_id, product_id, oder_quantity)
value (3,1,8);
insert into order_detail (order_id, product_id, oder_quantity)
value (2,5,4);
insert into order_detail (order_id, product_id, oder_quantity)
value (2,3,3);
select*from order_detail;

-- Hiển thị các thông tin  gồm oID, oDate, oPrice của tất cả các hóa đơn trong bảng Order --
select order_id, order_date, order_total_price
from `order`;

-- Hiển thị danh sách các khách hàng đã mua hàng, và danh sách sản phẩm được mua bởi các khách --
select customer_name, product_name from customer 
inner join `order` on customer.customer_id = `order`.customer_id
inner join order_detail on `order`.order_id = order_detail.order_id
inner join product on order_detail.product_id = product.product_id;

-- Hiển thị tên những khách hàng không mua bất kỳ một sản phẩm nào
select customer_name from customer 
left join `order` on customer.customer_id = `order`.customer_id
where `order`.customer_id is null; 

/* Hiển thị mã hóa đơn, ngày bán và giá tiền của từng hóa đơn 
(giá một hóa đơn được tính bằng tổng giá bán của từng loại mặt hàng xuất hiện trong hóa đơn. Giá bán của từng loại được tính = odQTY*pPrice)*/
-- table cần sử dụng order, order_detail,product
select `order`.order_id,order_date,sum(oder_quantity*product_price) as total_price
from `order`
inner join order_detail on `order`.order_id = order_detail.order_id
inner join product on order_detail.product_id = product.product_id
group by order_id;