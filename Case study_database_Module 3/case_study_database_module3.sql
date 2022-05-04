create database if not exists case_study_dataBase_module3;
-- bảng vị trí
use case_study_dataBase_module3;
create table vi_tri(
ma_vi_tri int primary key,
ten_vi_tri varchar(45));

-- bảng trình độ
create table trinh_do(
ma_trinh_do int primary key,
ten_trinh_do varchar(45));

-- bảng bộ phận
create table bo_phan(
ma_bo_phan int primary key,
ten_bo_phan varchar(45));

-- bảng nhân viên
create table nhan_vien(
ma_nhan_vien int auto_increment primary key,
ho_ten varchar(45),
ngay_sinh date,
so_cmnd varchar(45),
luong double,
so_dien_thoai varchar(45),
email varchar(45),
dia_chi varchar(45),
ma_vi_tri int,
ma_trinh_do int,
ma_bo_phan int,
foreign key(ma_vi_tri) references vi_tri(ma_vi_tri),
foreign key(ma_trinh_do) references trinh_do(ma_trinh_do),
foreign key(ma_bo_phan) references bo_phan(ma_bo_phan));

-- bảng loại khách
create table loai_khach(
ma_loai_khach int primary key,
ten_loai_khach varchar(45));

-- bảng khách hàng
create table khach_hang(
ma_khach_hang int primary key,
ma_loai_khach int,
ho_ten varchar(45),
ngay_sinh date,
gioi_tinh bit(1),
so_cmnd varchar(45),
so_dien_thoai varchar(45),
email varchar(45),
dia_chi varchar(45),
foreign key(ma_loai_khach) references loai_khach(ma_loai_khach));

-- bảng kiểu thế
create table kieu_thue(
ma_kieu_thue int primary key,
ten_kieu_thue varchar(45));

-- bảng loại dịch vụ
create table loai_dich_vu(
ma_loai_dich_vu int primary key,
ten_loai_dich_vu varchar(45));

-- bảng dịch vụ
create table dich_vu(
ma_dich_vu int primary key,
ten_dich_vu varchar(45),
dien_tich int,
chi_phi_thue double,
so_nguoi_toi_da int,
ma_kieu_thue int,
ma_loai_dich_vu int,
tieu_chuan_phong varchar(45),
mo_ta_tien_nghi_khac varchar(45),
dien_tich_ho_boi double,
so_tang int,
foreign key(ma_kieu_thue) references kieu_thue(ma_kieu_thue),
foreign key(ma_loai_dich_vu) references loai_dich_vu(ma_loai_dich_vu));
-- bảng hợp đồng

create table hop_dong(
ma_hop_dong int primary key,
ngay_lam_hop_dong datetime,
ngay_ket_thuc datetime,
tien_dac_coc double,
ma_nhan_vien int,
ma_khach_hang int,
ma_dich_vu int,
foreign key(ma_nhan_vien) references nhan_vien(ma_nhan_vien),
foreign key(ma_khach_hang) references khach_hang(ma_khach_hang),
foreign key(ma_dich_vu) references dich_vu(ma_dich_vu));

-- bảng dịch vụ đính kèm
create table dich_vu_di_kem(
ma_dich_vu_di_kem int primary key,
ten_dich_vu_di_kem varchar(45),
gia double,
don_vi varchar(10),
trang_thai varchar(45));

-- bảng hợp đồng chi tiết
create table hop_dong_chi_tiet(
ma_hop_dong_chi_tiet int primary key,
ma_hop_dong int,
ma_dich_vu_di_kem int,
so_luong int,
foreign key(ma_hop_dong) references hop_dong(ma_hop_dong),
foreign key(ma_dich_vu_di_kem) references dich_vu_di_kem(ma_dich_vu_di_kem));

-- ** câu 1:	Thêm mới thông tin cho tất cả các bảng có trong CSDL
-- nhập bảng vị trí:
insert into vi_tri(ma_vi_tri,ten_vi_tri) value (1,'Quản Lý');
insert into vi_tri(ma_vi_tri,ten_vi_tri) value (2,'Nhân Viên');
select*from vi_tri;

-- nhập bảng trình độ:
insert into trinh_do(ma_trinh_do, ten_trinh_do) value (1,'Trung Cấp');
insert into trinh_do(ma_trinh_do, ten_trinh_do) value (2,'Cao Đẳng');
insert into trinh_do(ma_trinh_do, ten_trinh_do) value (3,'Đại Học');
insert into trinh_do(ma_trinh_do, ten_trinh_do) value (4,'Sau Đại Học');
select*from trinh_do;


-- nhập bảng bộ phận:
insert into bo_phan(ma_bo_phan, ten_bo_phan) value (1, 'Sale-Marketing');
insert into bo_phan(ma_bo_phan, ten_bo_phan) value (2, 'Hành chính');
insert into bo_phan(ma_bo_phan, ten_bo_phan) value (3, 'Phục vụ');
insert into bo_phan(ma_bo_phan, ten_bo_phan) value (4, 'Quản lý');
select*from bo_phan;

-- nhập bảng nhận viên:
insert into nhan_vien(ma_nhan_vien, ho_ten, ngay_sinh, so_cmnd, luong, so_dien_thoai, email, dia_chi, ma_vi_tri, ma_trinh_do, ma_bo_phan)
value (1,'Nguyễn Văn An','1970-11-07','456231786',10000000,'0901234121','annguyen@gmail.com','295 Nguyễn Tất Thành, Đà Nẵng',1,3,1);
INSERT INTO `case_study_database_module3`.`nhan_vien` (`ma_nhan_vien`, `ho_ten`, `ngay_sinh`, `so_cmnd`, `luong`, `so_dien_thoai`, `email`, `dia_chi`, `ma_vi_tri`, `ma_trinh_do`, `ma_bo_phan`) VALUES ('2', 'Lê Văn Bình', '1997-04-09', '654231234', '7000000', '0934212314', 'binhlv@gmail.com', '22 Yên Bái, Đà Nẵng', '1', '2', '2');
INSERT INTO `case_study_database_module3`.`nhan_vien` (`ma_nhan_vien`, `ho_ten`, `ngay_sinh`, `so_cmnd`, `luong`, `so_dien_thoai`, `email`, `dia_chi`, `ma_vi_tri`, `ma_trinh_do`, `ma_bo_phan`) VALUES ('3', 'Hồ Thị Yến', '1995-12-12', '999231723', '14000000', '0412352315', 'thiyen@gmail.com', 'K234/11 Điện Biên Phủ, Gia Lai', '1', '3', '2');
INSERT INTO `case_study_database_module3`.`nhan_vien` (`ma_nhan_vien`, `ho_ten`, `ngay_sinh`, `so_cmnd`, `luong`, `so_dien_thoai`, `email`, `dia_chi`, `ma_vi_tri`, `ma_trinh_do`, `ma_bo_phan`) VALUES ('4', 'Võ Công Toản', '1980-04-04', '123231365', '17000000', '0374443232', 'toan0404@gmail.com', '77 Hoàng Diệu, Quảng Trị', '1', '4', '4');
INSERT INTO `case_study_database_module3`.`nhan_vien` (`ma_nhan_vien`, `ho_ten`, `ngay_sinh`, `so_cmnd`, `luong`, `so_dien_thoai`, `email`, `dia_chi`, `ma_vi_tri`, `ma_trinh_do`, `ma_bo_phan`) VALUES ('5', 'Nguyễn Bỉnh Phát', '1999-12-09', '454363232', '6000000', '0902341231', 'phatphat@gmail.com', '43 Yên Bái, Đà Nẵng', '2', '1', '1');
INSERT INTO `case_study_database_module3`.`nhan_vien` (`ma_nhan_vien`, `ho_ten`, `ngay_sinh`, `so_cmnd`, `luong`, `so_dien_thoai`, `email`, `dia_chi`, `ma_vi_tri`, `ma_trinh_do`, `ma_bo_phan`) VALUES ('6', 'Khúc Nguyễn An Nghi', '2000-11-08', '964542311', '7000000', '0978653213', 'annghi20@gmail.com', '294 Nguyễn Tất Thành, Đà Nẵng', '2', '2', '3');
INSERT INTO `case_study_database_module3`.`nhan_vien` (`ma_nhan_vien`, `ho_ten`, `ngay_sinh`, `so_cmnd`, `luong`, `so_dien_thoai`, `email`, `dia_chi`, `ma_vi_tri`, `ma_trinh_do`, `ma_bo_phan`) VALUES ('7', 'Nguyễn Hữu Hà', '1993-01-01', '534323231', '8000000', '0941234553', 'nhh0101@gmail.com', '4 Nguyễn Chí Thanh, Huế', '2', '3', '2');
INSERT INTO `case_study_database_module3`.`nhan_vien` (`ma_nhan_vien`, `ho_ten`, `ngay_sinh`, `so_cmnd`, `luong`, `so_dien_thoai`, `email`, `dia_chi`, `ma_vi_tri`, `ma_trinh_do`, `ma_bo_phan`) VALUES ('8', 'Nguyễn Hà Đông', '1989-09-03', '234414123', '9000000', '0642123111', 'donghanguyen@gmail.com', '111 Hùng Vương, Hà Nội', '2', '4', '4');
INSERT INTO `case_study_database_module3`.`nhan_vien` (`ma_nhan_vien`, `ho_ten`, `ngay_sinh`, `so_cmnd`, `luong`, `so_dien_thoai`, `email`, `dia_chi`, `ma_vi_tri`, `ma_trinh_do`, `ma_bo_phan`) VALUES ('9', 'Tòng Hoang', '1982-09-03', '256781231', '6000000', '0245144444', 'hoangtong@gmail.com', '213 Hàm Nghi, Đà Nẵng', '2', '4', '4');
INSERT INTO `case_study_database_module3`.`nhan_vien` (`ma_nhan_vien`, `ho_ten`, `ngay_sinh`, `so_cmnd`, `luong`, `so_dien_thoai`, `email`, `dia_chi`, `ma_vi_tri`, `ma_trinh_do`, `ma_bo_phan`) VALUES ('10', 'Nguyễn Công Đạo', '1994-01-08', '755434343', '8000000', '0988767111', 'nguyencongdao12@gmail.com', '6 Hoà Khánh, Đồng Nai', '2', '3', '2');
select*from nhan_vien;

-- nhập bảng loại khách:
INSERT INTO `case_study_database_module3`.`loai_khach` (`ma_loai_khach`, `ten_loai_khach`) VALUES ('1', 'Diamond');
INSERT INTO `case_study_database_module3`.`loai_khach` (`ma_loai_khach`, `ten_loai_khach`) VALUES ('2', 'Platinium');
INSERT INTO `case_study_database_module3`.`loai_khach` (`ma_loai_khach`, `ten_loai_khach`) VALUES ('3', 'Gold');
INSERT INTO `case_study_database_module3`.`loai_khach` (`ma_loai_khach`, `ten_loai_khach`) VALUES ('4', 'Silver');
INSERT INTO `case_study_database_module3`.`loai_khach` (`ma_loai_khach`, `ten_loai_khach`) VALUES ('5', 'Member');
select*from loai_khach;

-- nhập bảng khách hàng:
INSERT INTO `case_study_database_module3`.`khach_hang` (`ma_khach_hang`, `ma_loai_khach`, `ho_ten`, `ngay_sinh`, `gioi_tinh`, `so_cmnd`, `so_dien_thoai`, `email`, `dia_chi`) VALUES ('1', '5', 'Nguyễn Thị Hào', '1970-11-07', 0, '643431213', '0945423362', 'thihao07@gmail.com', '23 Nguyễn Hoàng, Đà Nẵng');
INSERT INTO `case_study_database_module3`.`khach_hang` (`ma_khach_hang`, `ma_loai_khach`, `ho_ten`, `ngay_sinh`, `gioi_tinh`, `so_cmnd`, `so_dien_thoai`, `email`, `dia_chi`) VALUES ('2', '3', 'Phạm Xuân Diệu', '1992-08-08', 1, '865342123', '0954333333', 'xuandieu92@gmail.com', 'K77/22 Thái Phiên, Quảng Trị');
INSERT INTO `case_study_database_module3`.`khach_hang` (`ma_khach_hang`, `ma_loai_khach`, `ho_ten`, `ngay_sinh`, `gioi_tinh`, `so_cmnd`, `so_dien_thoai`, `email`, `dia_chi`) VALUES ('3', '1', 'Trương Đình Nghệ', '1990-02-27', 1, '488645199', '0373213122', 'nghenhan2702@gmail.com', 'K323/12 Ông Ích Khiêm, Vinh');
INSERT INTO `case_study_database_module3`.`khach_hang` (`ma_khach_hang`, `ma_loai_khach`, `ho_ten`, `ngay_sinh`, `gioi_tinh`, `so_cmnd`, `so_dien_thoai`, `email`, `dia_chi`) VALUES ('4', '1', 'Dương Văn Quan', '1981-07-08', 1, '543432111', '0490039241', 'duongquan@gmail.com', 'K453/12 Lê Lợi, Đà Nẵng');
INSERT INTO `case_study_database_module3`.`khach_hang` (`ma_khach_hang`, `ma_loai_khach`, `ho_ten`, `ngay_sinh`, `gioi_tinh`, `so_cmnd`, `so_dien_thoai`, `email`, `dia_chi`) VALUES ('5', '4', 'Hoàng Trần Nhi Nhi', '1995-12-09', 0, '795453345', '0312345678', 'nhinhi123@gmail.com', '224 Lý Thái Tổ, Gia Lai');
INSERT INTO `case_study_database_module3`.`khach_hang` (`ma_khach_hang`, `ma_loai_khach`, `ho_ten`, `ngay_sinh`, `gioi_tinh`, `so_cmnd`, `so_dien_thoai`, `email`, `dia_chi`) VALUES ('6', '4', 'Tôn Nữ Mộc Châu', '2005-12-06', 0, '732434215', '0988888844', 'tonnuchau@gmail.com', '37 Yên Thế, Đà Nẵng');
INSERT INTO `case_study_database_module3`.`khach_hang` (`ma_khach_hang`, `ma_loai_khach`, `ho_ten`, `ngay_sinh`, `gioi_tinh`, `so_cmnd`, `so_dien_thoai`, `email`, `dia_chi`) VALUES ('7', '1', 'Nguyễn Mỹ Kim', '1984-04-08', 0, '856453123', '0912345698', 'kimcuong84@gmail.com', 'K123/45 Lê Lợi, Hồ Chí Minh');
INSERT INTO `case_study_database_module3`.`khach_hang` (`ma_khach_hang`, `ma_loai_khach`, `ho_ten`, `ngay_sinh`, `gioi_tinh`, `so_cmnd`, `so_dien_thoai`, `email`, `dia_chi`) VALUES ('8', '3', 'Nguyễn Thị Hào', '1999-04-08', 0, '965656433', '0763212345', 'haohao99@gmail.com', '55 Nguyễn Văn Linh, Kon Tum');
INSERT INTO `case_study_database_module3`.`khach_hang` (`ma_khach_hang`, `ma_loai_khach`, `ho_ten`, `ngay_sinh`, `gioi_tinh`, `so_cmnd`, `so_dien_thoai`, `email`, `dia_chi`) VALUES ('9', '1', 'Trần Đại Danh', '1994-07-01', 1, '432341235', '0643343433', 'danhhai99@gmail.com', '24 Lý Thường Kiệt, Quảng Ngãi');
INSERT INTO `case_study_database_module3`.`khach_hang` (`ma_khach_hang`, `ma_loai_khach`, `ho_ten`, `ngay_sinh`, `gioi_tinh`, `so_cmnd`, `so_dien_thoai`, `email`, `dia_chi`) VALUES ('10', '2', 'Nguyễn Tâm Đắc', '1989-07-01', 1, '344343432', '0987654321', 'dactam@gmail.com', '22 Ngô Quyền, Đà Nẵng');
select*from khach_hang;

-- nhập bảng kiểu thuê: 
insert into kieu_thue (ma_kieu_thue, ten_kieu_thue) value (1, 'year');
insert into kieu_thue (ma_kieu_thue, ten_kieu_thue) value (2, 'month');
insert into kieu_thue (ma_kieu_thue, ten_kieu_thue) value (3, 'day');
insert into kieu_thue (ma_kieu_thue, ten_kieu_thue) value (4, 'hour');
select*from kieu_thue;

-- nhập bảng loại dịch vu: 
insert into loai_dich_vu(ma_loai_dich_vu, ten_loai_dich_vu) value(1, 'Villa');
insert into loai_dich_vu(ma_loai_dich_vu, ten_loai_dich_vu) value(2, 'House');
insert into loai_dich_vu(ma_loai_dich_vu, ten_loai_dich_vu) value(3, 'Room');
select*from loai_dich_vu;

-- nhập bảng dịch vụ: 
insert into dich_vu(ma_dich_vu, ten_dich_vu, dien_tich, chi_phi_thue, so_nguoi_toi_da, ma_kieu_thue, ma_loai_dich_vu, tieu_chuan_phong, mo_ta_tien_nghi_khac, dien_tich_ho_boi, so_tang)
value (1, 'Villa Beach Front', 25000, 10000000, 10, 3, 1, 'vip', 'Có hồ bơi', 500, 4);
