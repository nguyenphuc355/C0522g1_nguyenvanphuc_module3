use quan_ly_ban_hang;

insert into customer
values 
(1,'Minh Quan', 10),
(2,'Ngoc Oanh',20),
(3,'Hong Ha',50);

select * from customer;

insert into `order`
values
(1,1,'2006-03-21', null),
(2,2,'2006-03-22',null),
(3,1,'2006-03-16',null);

select * from `order`;

insert into product 
values
(1,'may giat',3),
(2,'tu lanh',5),
(3,'dieu hoa',7),
(4,'quat',1),
(5,'bep dien',2);
select * from product;

insert into orderdetail
values
(1,1,3),
(1,3,7),
(1,4,2),
(2,1,1),
(3,1,8),
(2,5,4),
(2,3,3);
select * from orderdetail;

-- Hiển thị các thông tin  gồm oID, oDate, oPrice của tất cả các hóa đơn trong bảng Order
select o_id, o_date,total_price from `order`;

-- Hiển thị danh sách các khách hàng đã mua hàng, và danh sách sản phẩm được mua bởi các khách
select customer.c_name,product.p_name 
from customer 
join `order` on customer.c_id = `order`.c_id
join  orderdetail on `order`.o_id = orderdetail.o_id
join product on product.p_id =orderdetail.p_id;

-- Hiển thị tên những khách hàng không mua bất kỳ một sản phẩm nào

select customer.c_id,customer.c_name
from customer
where customer.c_id not in
(  select customer.c_id
from customer
join `order` on customer.c_id = `order`.c_id
join orderdetail on orderdetail.o_id = `order`.o_id
join product on product.p_id = orderdetail.p_id);

-- Hiển thị mã hóa đơn, ngày bán và giá tiền của từng hóa đơn 
-- (giá một hóa đơn được tính bằng tổng giá bán của từng loại mặt
--  hàng xuất hiện trong hóa đơn. Giá bán của từng loại được tính = odQTY*pPrice)

select `order`.o_id, `order`.o_date as date_pay, 
sum((ifnull(orderdetail.o_dqty,0)* ifnull(product.p_price,0))) as bill_order
from `order`
join orderdetail on `order`.o_id = orderdetail.o_id
join product on product.p_id = orderdetail.p_id
group by `order`.o_id;




