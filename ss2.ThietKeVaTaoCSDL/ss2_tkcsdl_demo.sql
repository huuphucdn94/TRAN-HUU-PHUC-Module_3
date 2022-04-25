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
it int primary key auto_increment,
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
-- lưu thông tin tình hình giảg dạy
create table class_instructor(
class_id int,
instructor_id int,
start_time date,
end_time date,
primary key(class_id, instructor_id),
foreign key(class_id) references class(id),
foreign key(instructor_id) references instructor(id)
);
