create database if not exists ss4_bt_student_management;
use ss4_bt_student_management;
-- drop database ss4_bt_student_management;

create table class(
class_id int primary key,
class_name varchar(60) not null,
start_date date not null,
`status` bit
);
insert into class
values(1,'A1','2008/12/20',1),(2,'A2','2008/12/22',1),(3,'A3',current_date(),0);

create table student(
student_id int primary key, 
student_name varchar(30) not null,
address varchar(50),
phone varchar(20),
`status` bit,
class_id int,
foreign key(class_id) references class(class_id)
);
insert into student 
values (1,'Hung','Ha noi','0912113113',1,1),(2,'Hoa','Hai Phong',null,1,1),(3,'Manh','HCM','0123123123',0,2);

create table `subject`(
sub_id int primary key,
sub_name varchar(30),
credit tinyint not null default 1 check(credit >= 1),
`status` bit default 1
);
insert into `subject`
values (1, 'CF', 5, 1),(2, 'C', 6, 1),(3, 'HDJ', 5, 1),(4, 'RDBMS', 10, 1);

create table mark(
mark_id int primary key auto_increment,
sub_id int not null,
student_id int not null,
mark float default 0 check(mark >=0 and mark <= 100),
exam_times tinyint default 1,
unique(sub_id, student_id),
foreign key(sub_id) references subject(sub_id),
foreign key(student_id) references student(student_id)
);
insert into mark(sub_id, student_id, mark, exam_times)
values (1, 1, 8, 1), (1, 2, 10, 2),(2, 1, 12, 1);

-- Hiển thị tất cả các thông tin môn học (bảng subject) có credit lớn nhất
select * from `subject`
where credit = (select max(credit) from `subject`);

-- Hiển thị các thông tin môn học có điểm thi lớn nhất
select * from `subject`
inner join mark on `subject`.sub_id = mark.sub_id
where mark = (select max(mark) from mark);

-- Hiển thị các thông tin sinh viên và điểm trung bình của mỗi sinh viên, xếp hạng theo thứ tự điểm giảm dần
select student_name,avg(mark) from student
inner join mark on student.student_id = mark.student_id
group by student.student_id
order by mark desc;