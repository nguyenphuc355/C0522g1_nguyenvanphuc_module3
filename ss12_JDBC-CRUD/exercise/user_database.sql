create database ss12_demo;
use ss12_demo;
 create table users(
 id int primary key auto_increment,
 `name` varchar(120) not null,
 email varchar(120) not null,
 country varchar(120)
 );
 
 insert into users(name,email,country)
 values
 ('phúc','VanPhuc@gmail.com','Nghệ An');
 
  insert into users(name,email,country)
 values
 ('Nam','VanNam@gmail.com','Quảng Nam'),
 ('Tý','Vanty@gmail.com','Gia Lai'),
 ('Huy','NgocHuy@gmail.com','Đà Nẵng'),
 ('Thuyên','TrungThuyen@gmail.com','Huế')
 ;
 select * from users;
 select * from users where id = 1;
 update users set `name`= 'tiên', email = 'Thuytien@gmail.com',country = 'Đà Nẵng' where id =1;
 select * from users where `name` like '%Tiên';
 select * from users
 order by `name`;
 
 
 
 
 
 