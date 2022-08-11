use quan_ly_sinh_vien;

-- Hiển thị số lượng sinh viên ở từng nơi
select student.address, count(student_id) as so_luong
from student 
group by address;

-- Tính điểm trung bình các môn học của mỗi học viên
select student.student_id,student.student_name, avg(mark) as avg_mark
from student 
join mark on student.student_id = mark.student_id
group by student.student_id ;

-- Hiển thị những bạn học viên co điểm trung bình các môn học lớn hơn 15
select student.student_id,student.student_name, avg(mark) as avg_mark
from student 
join mark on student.student_id = mark.student_id
group by student.student_id 
having  avg(mark) > 15;


-- Hiển thị thông tin các học viên có điểm trung bình lớn nhất.
select student.student_id,student.student_name, avg(mark) as avg_mark
from student 
join mark on student.student_id = mark.student_id
group by student.student_id 
HAVING AVG(mark) >= ALL (SELECT AVG(mark) FROM mark GROUP BY mark.student_id);








