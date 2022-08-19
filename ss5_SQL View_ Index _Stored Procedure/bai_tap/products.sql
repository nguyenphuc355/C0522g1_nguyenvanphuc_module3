 drop database demo;
 create database demo;
 use demo;
 
 create table products(
 id int auto_increment primary key,
 product_code int not null,
 product_name varchar(50),
 product_price varchar(50),
 product_amount varchar(50),
 product_decription varchar(50),
 product_status varchar(50)
 );
 
 insert into products(product_code,product_name,product_price,product_amount,product_decription,product_status)
 values
 (123123,'phone','12000000','20','new','100%'),
 (123345,'ipad','15000000','24','like new','95%'),
 (345567,'laptop','12000000','20','like new','99%'),
 (342324,'samsung note 20','12000000','20','like new','97%'),
 (567897,'oppo R8','12000000','20','like new','97%');
 
-- Tạo Unique Index trên bảng Products (sử dụng cột productCode để tạo chỉ mục)
select * from products;
create index i_product_code on products(product_code);
drop index i_product_code on products;

-- Tạo Composite Index trên bảng Products (sử dụng 2 cột productName và productPrice)
create index i_product on products(product_name, product_price);
drop index i_product  on products;

-- Sử dụng câu lệnh EXPLAIN để biết được câu lệnh SQL của bạn thực thi như nào
 explain select * from products where product_code =567897;
 explain select * from products where product_name ='samsung note 20';
 
 
 -- Tạo view lấy về các thông tin: productCode, productName, productPrice, productStatus từ bảng products.
 create view w_product as 
 select product_code,product_name,product_price,product_status from products;
 select * from w_product;
 
 -- Tiến hành sửa đổi view
 SET SQL_SAFE_UPDATES = 0;
 update w_product 
 set product_code =1
 where product_name = 'phone';
 
 -- Tiến hành xoá view
 drop view w_product;
 
 -- Tạo store procedure lấy tất cả thông tin của tất cả các sản phẩm trong bảng product
delimiter //
create procedure sp_get_product()
begin 
select * from products;
end //
delimiter ;
 call sp_get_product();
 
 -- Tạo store procedure thêm một sản phẩm mới
delimiter //
create procedure sp_add_product(
 p_code int ,
 p_name varchar(50),
 p_price varchar(50),
 p_amount varchar(50),
 p_decription varchar(50),
 p_status varchar(50))
begin 
insert into products(
 product_code ,
 product_name ,
 product_price ,
 product_amount,
 product_decription,
 product_status)
values
(p_code ,
 p_name ,
 p_price ,
 p_amount,
 p_decription,
 p_status);
end //
delimiter ;
 call sp_add_product(333333,'iphone 13 mini','16000000','10','new','100');
 
 
 -- Tạo store procedure sửa thông tin sản phẩm theo id
 
 delimiter //
create procedure sp_update_product(
p_id int,
 p_code int ,
 p_name varchar(50),
 p_price varchar(50),
 p_amount varchar(50),
 p_decription varchar(50),
 p_status varchar(50))
begin 
update  products
set
 id = p_id,
 product_code = p_code,
 product_name = p_name  ,
 product_price =  p_price ,
 product_amount =  p_amount,
 product_decription =  p_decription,
 product_status= p_status
 where id = p_id;
end //
delimiter ;
call sp_update_product(2,888888,'samsung note 10','16000000','10', 'like new', '90%');
 
-- Tạo store procedure xoá sản phẩm theo id
delimiter //
create procedure sp_delete_by_id(IN p_id int)
begin 
delete from products where id = p_id;
end //
delimiter ;
 call sp_delete_by_id(1);
 
 select * from products;
 
 
 
 
 
 
 
 