use quan_ly_sinh_vien;

-- Hiển thị tất cả các thông tin môn học (bảng subject) có credit lớn nhất.
select * from `subject`
where credit = (
	select max(credit) 
	from  `subject`);
 
 -- Hiển thị các thông tin môn học có điểm thi lớn nhất.
 select `subject`.sub_name,mark.mark 
 from mark
 join `subject` on `subject`.sub_id = mark.sub_id
 where mark.mark = (
					select max(mark.mark) 
					from mark);
 
 -- Hiển thị các thông tin sinh viên và điểm trung bình của mỗi sinh viên, xếp hạng theo thứ tự điểm giảm dần
 
select student.student_id,student.student_name,avg(mark) as `avg` 
from mark 
join student on student.student_id = mark.student_id
group by student_id
order by mark desc;








