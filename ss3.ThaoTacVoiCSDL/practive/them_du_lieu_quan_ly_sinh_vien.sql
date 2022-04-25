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

create table subject(
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
foreign key(sub_id) references subject(sub_id),
foreign key(student_id) references student(student_id)
);
-- Sử dụng câu lệnh insert into để thêm dữ liệu vào trong các bảng
	-- bang class:
insert into class value (1,'A1','2008-12-20',1);
insert into class value (2,'A2','2008-12-22',1);
insert into class value (3,'A3',current_date,0);
select*from class;
    -- bang student
insert into student (student_name, address, phone, `status`, class_id) 
value ('Hung', 'Ha Noi', '0912113113', 1, 1);
