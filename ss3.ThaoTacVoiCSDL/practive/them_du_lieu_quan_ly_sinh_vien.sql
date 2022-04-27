create database quan_ly_sinh_vien;
use quan_ly_sinh_vien;

create table class(
class_id int not null auto_increment primary key,
class_name varchar(60) not null,
start_date datetime not null,
`status` bit);

create table student(
student_id int not null auto_increment primary key,
student_name varchar(30),
address varchar(50),
phone varchar(20),
`status` bit,
class_id int not null,
foreign key(class_id) references class(class_id));

create table `subject`(
sub_id int not null auto_increment primary key,
sub_name varchar(30) not null,
credit tinyint not null default 1 check(credit >=1),
`status` bit default 1);

create table mark(
mark_id int not null auto_increment primary key,
sub_id int not null,
student_id int not null,
mark float default 0 check(mark between 0 and 100),
exam_times tinyint default 1,
unique(sub_id,student_id),
foreign key(sub_id) references `subject`(sub_id),
foreign key(student_id) references student(student_id)
);
-- them du lieu vao bang class
use quan_ly_sinh_vien;
insert into class value (1, 'A1', '2008-12-20', 1);
insert into class value (2, 'A2', '2008-12-22', 1);
insert into class value (3, 'B3', current_date, 0);
select*from class;
-- them du lieu vao bang student
insert into student(student_name,address,phone,`status`,class_id) 
value ('Hung', 'Ha Noi', '0912113113', 1, 1);
insert into student(student_name,address,phone,`status`,class_id) 
value ('Hoa', 'Hai phong','0795591333', 1, 1);
insert into student(student_name,address,phone,`status`,class_id) 
value ('Manh', 'HCM', '0123123123', 0, 2);
select*from student;

-- them du lieu vao bang subject
insert into subject value (1, 'CF', 5, 1),(2, 'C', 6, 1),(3, 'HDJ', 5, 1),(4, 'RDBMS', 10, 1);
select*from subject;

-- them du lieu vao bang mark
insert into mark (sub_id, student_id, mark, exam_times) 
value (1, 1, 8, 1),(1, 2, 10, 2),(2, 1, 12, 1);
select*from mark;


