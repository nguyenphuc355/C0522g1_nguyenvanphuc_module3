create database student_managemrnt;

use student_managemrnt;


create table class(
id int primary key,
`name` varchar(255) not null
);
insert into class
values 
(1,'c0522g1');

select * from class;
create table teacher (
id int primary key,
`name` varchar(255) not null,
age int,
country varchar(255)
);

insert into teacher()
values(1,'Cong',30,'Viet Nam');

select*from teacher;