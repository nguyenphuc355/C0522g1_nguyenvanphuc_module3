create database quan_ly_diem_thi;
use quan_ly_diem_thi;
create table hoc_sinh(
ma_hs int primary key,
ten_hs varchar(45),
ngay_sinh varchar(45),
lop varchar(45),
gt varchar(45)
);



create table mon_hoc(
ma_mon_hoc int primary key,
ten_mon_hoc varchar(45),
ma_gv int,
foreign key (ma_gv) references giao_vien(ma_gv) 
);

create table bang_diem(
ma_hs int,
foreign key (ma_hs) references hoc_sinh(ma_hs),
ma_mon_hoc int,
foreign key (ma_mon_hoc) references mon_hoc(ma_mon_hoc),
diem_thi int not null,
ngay_kiem_tra datetime not null,
primary key(ma_hs,ma_mon_hoc)
);

create table giao_vien(
ma_gv int primary key,
ten_gv varchar(45),
so_dien_thoai varchar(45)
);