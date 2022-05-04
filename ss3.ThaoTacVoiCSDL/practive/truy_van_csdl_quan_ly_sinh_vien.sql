use quan_ly_sinh_vien;
select*from student;
select*from student where status = true;

select*from subject;
select*from subject where credit <10;

select*from class;
select*from student;
select student.student_id, student.student_name, class.class_id 
from student join class on student.class_id = class.class_id;

select student.student_id, student.student_name, class.class_id 
from student join class on student.class_id = class.class_id where class.class_name = 'A1';

