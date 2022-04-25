-- 2. Lấy ra thông tin các học viên, và cho biết các học viên đang theo học lớp nào, lớp đó thuộc loại lớp nào.
-- 3. Lấy ra thông tin các học viên đang theo học tại các lớp kể cả các học viên không theo học lớp nào.
-- 4. Lấy thông tin của các học viên tên 'Tien' và 'Toan’.
-- 6. Lấy ra danh sách học viên và sắp xếp tên theo alphabet.
create database if not exists a1121i1;
use a1121i1;
create table jame(
 `account` varchar(50) primary key,
 `password` varchar(50)
);
create table class_type(
 id int auto_increment primary key,
  class_type_name varchar(50)
);
create table class(
 id int auto_increment primary key,
 `name` varchar(50),
 class_type_id int,
 foreign key(class_type_id) references class_type(id)
);
create table student(
 id int primary key auto_increment,
 name varchar(50),
 birthday date,
 gender boolean,
 email varchar(50),
 point int,
 `account` varchar(50),
 class_id int,
 foreign key(`account`) references jame(`account`),
 foreign key(class_id) references class(id)
);
create table instructor(
id int auto_increment primary key,
`name` varchar(50),
birthday date,
salary float
);
-- lưu tính hình giảng dạy của giảng viên
create table class_instructor(
 class_id int,
 instructor_id int,
 primary key(class_id,instructor_id),
 foreign key(class_id) references class(id),
 foreign key(instructor_id) references instructor(id)
);
-- 1. Lấy ra thông tin các học viên, và cho biết các học viên đang theo học lớp nào.
SELECT student.id, student.name, student.point, class.name as class_name, class_type.class_type_name FROM student 
left join class on student.class_id = class.id
left join class_type on class.class_type_id = class_type.id
union
SELECT student.id, student.name, student.point, class.name as class_name, class_type.class_type_name  FROM student 
right join class on student.class_id = class.id
left join class_type on class.class_type_id = class_type.id
;
-- 4. Lấy thông tin của các học viên tên 'An'.
select * from  student having name = "an" AND point > 10;

-- LIKE tìm kiếm gần đúng. 
select * from  student where name LIKE "%a%" ;
-- 5. Lấy ra số lượng học viên của từng lớp.
-- FROM -> ON -> JOIN -> WHERE -> GROUP BY -> HAVING -> SELECT -> ORDER BY
select * , count(class_id) as so_luong_student, sum(point ) as avg from class 
join student on class.id = student.class_id 
where point >= 10 
group by class_id having so_luong_student > 0 
order by so_luong_student DESC;



-- Xét thêm điều kiện sắp xếp. Nếu điều kiện trước có giá trị = nhau thì tiếp tục xép thêm dkien sau dấu ,  
select * from  student order by point DESC, birthday DESC ;












