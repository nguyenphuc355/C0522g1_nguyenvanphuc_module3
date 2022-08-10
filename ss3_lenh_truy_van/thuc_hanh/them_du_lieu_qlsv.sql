use quan_ly_sinh_vien;

INSERT INTO Class(class_name,start_date,`status`)
values 
('A1','2008-12-20',1),
('A2','2008-12-22',1),
('B3',Current_Date,0);
select * from class;

insert into student (student_name,address,phone,`status`,class_id)
values 
('Hung','Ha Noi','0912113113',1,1),
('Hoa','Hai Phong',null,1,1),
('Manh','HCM','0123123123',0,2);
select * from student;

insert into `subject`(sub_name,credit)
values 
('CF',5),
('C',6),
('HDJ',5),
('RDBMS',10);
select * from `subject`;

insert into mark(sub_id,student_id,mark,exam_time)
VALUES (1, 1, 8, 1),
       (1, 2, 10, 2),
       (2, 1, 12, 1);
select * from mark;