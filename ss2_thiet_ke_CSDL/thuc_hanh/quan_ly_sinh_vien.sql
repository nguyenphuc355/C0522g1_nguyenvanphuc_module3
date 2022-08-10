drop database if exists quan_ly_sinh_vien;
create database quan_ly_sinh_vien;
use quan_ly_sinh_vien;
create table class(
class_id int primary key  auto_increment ,
class_name varchar(60) not null,
start_date datetime not null,
`status` bit 
);

create table student(
student_id int  primary key auto_increment,
student_name varchar(30) not null,
address varchar(50),
phone varchar(20),
`status` bit,
class_id int not null,
foreign key (class_id) references class(class_id)
);

create table `subject`(
sub_id int primary key auto_increment,
sub_name varchar(30),
credit tinyint not null default 1 check(credit >=1),
`status` bit default 1
);

create table mark(
   mark_id   INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
   sub_id    INT NOT NULL,
   student_id INT NOT NULL,
   mark   FLOAT   DEFAULT 0 CHECK ( Mark BETWEEN 0 AND 100),
   exam_time TINYINT DEFAULT 1,
    UNIQUE (sub_id, student_id),
    FOREIGN KEY (sub_id) REFERENCES `subject` (sub_id),
    FOREIGN KEY (student_id) REFERENCES student(student_id)
);
