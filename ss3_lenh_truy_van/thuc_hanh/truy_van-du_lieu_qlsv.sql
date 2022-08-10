use quan_ly_sinh_vien;

-- Hiển thị danh sách tất cả các học viên
select * from student;

-- Hiển thị danh sách các học viên đang theo học.
select * from student 
where `status` = true;

-- Hiển thị danh sách các môn học có thời gian học nhỏ hơn 10 giờ.
select sub_id,sub_name,credit from `subject`
where credit <10;

-- Hiển thị danh sách học viên lớp A1
select student_id,student_name,class.class_name from student 
join class on student.class_id = class.class_id
where class.class_name = 'A1';

-- Hiển thị điểm môn CF của các học viên.
select student.student_id, student.student_name,`subject`.sub_name,mark.mark
 from student join mark on student.student_id = mark.student_id
 join `subject` on `subject`.sub_id = mark.sub_id
 where `subject`.sub_id = 1;