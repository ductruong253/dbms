USE master
GO

DROP DATABASE IF EXISTS quanLyThuVien
GO

CREATE DATABASE quanLyThuVien
GO

USE quanLyThuVien
GO

DROP TABLE IF EXISTS tuasach
GO
DROP TABLE IF EXISTS dausach
GO
DROP TABLE IF EXISTS dangky
GO
DROP TABLE IF EXISTS nguoilon
GO
DROP TABLE IF EXISTS treem
GO
DROP TABLE IF EXISTS qtrinhmuon
GO
DROP TABLE IF EXISTS cuonsach
GO
DROP TABLE IF EXISTS muon
GO
DROP TABLE IF EXISTS docgia
GO

CREATE TABLE tuasach (
	ma_tuasach INT PRIMARY KEY,
	tuasach NVARCHAR(63) NOT NULL,
	tacgia NVARCHAR(31) NOT NULL,
	tomtat NVARCHAR(16)
)
GO

CREATE TABLE dausach (
	isbn INT PRIMARY KEY,
	ma_tuasach int NOT NULL,
	ngonngu nchar(15),
	bia nchar(15),
	trangthai NCHAR(1),
	CONSTRAINT dausach_tuasach_lk
	FOREIGN KEY (ma_tuasach) REFERENCES tuasach(ma_tuasach)
)
GO

CREATE TABLE docgia (
	ma_docgia SMALLINT PRIMARY KEY,
	ho NVARCHAR(15) NOT NULL,
	tenlot CHAR,
	ten NVARCHAR(15) NOT NULL,
	ngay_sinh DATETIME NOT NULL
)
GO

CREATE TABLE nguoilon (
	ma_docgia SMALLINT NOT NULL PRIMARY KEY,
	sonha NVARCHAR(15) NOT NULL,
	duong NVARCHAR(63) NOT NULL,
	quan CHAR(2) NOT NULL,
	dienthoai CHAR(13),
	han_sd DATETIME NOT NULL,
	CONSTRAINT nguoilon_docgia_lk
	FOREIGN KEY (ma_docgia) REFERENCES docgia(ma_docgia)
)
GO

CREATE TABLE treem (
	ma_docgia SMALLINT NOT NULL PRIMARY KEY,
	ma_docgia_nglon SMALLINT NOT NULL,
	CONSTRAINT treem_docgia_lk
	FOREIGN KEY (ma_docgia) REFERENCES docgia(ma_docgia),
	CONSTRAINT treem_nguoilon_lk
	FOREIGN KEY (ma_docgia_nglon) REFERENCES nguoilon(ma_docgia)
)
GO

CREATE TABLE dangky (
	isbn INT NOT NULL,
	ma_docgia SMALLINT NOT NULL,
	ngay_dk DATETIME,
	ghichu NVARCHAR(255),
	PRIMARY KEY (isbn, ma_docgia),
	CONSTRAINT dangky_dausach_lk
	FOREIGN KEY (isbn) REFERENCES dausach(isbn),
	CONSTRAINT dangky_docgia_lk
	FOREIGN KEY (ma_docgia) REFERENCES docgia(ma_docgia)
)
GO

CREATE TABLE cuonsach (
	isbn INT NOT NULL,
	ma_cuonsach SMALLINT NOT NULL,
	tinhtrang NCHAR(1) NOT NULL,
	PRIMARY KEY (isbn, ma_cuonsach),
	CONSTRAINT cuonsach_dausach_lk
	FOREIGN KEY (isbn) REFERENCES dausach(isbn)
)
GO

CREATE TABLE muon (
	isbn INT NOT NULL,
	ma_cuonsach SMALLINT NOT NULL,
	ma_docgia SMALLINT NOT NULL,
	ngay_muon DATETIME NOT NULL,
	ngay_hethan DATETIME NOT NULL
	PRIMARY KEY (isbn, ma_cuonsach),
	CONSTRAINT muon_cuonsach
	FOREIGN KEY (isbn, ma_cuonsach) REFERENCES cuonsach(isbn, ma_cuonsach),
	CONSTRAINT muon_docgia_lk
	FOREIGN KEY (ma_docgia) REFERENCES docgia(ma_docgia)
)
GO

CREATE TABLE qtrinhmuon (
	isbn INT NOT NULL,
	ma_cuonsach SMALLINT NOT NULL,
	ngay_muon DATETIME NOT NULL,
	ma_docgia SMALLINT NOT NULL,
	ngay_hethan DATETIME,
	ngay_tra DATETIME,
	tien_phat DECIMAL(9,3),
	tien_datra DECIMAL(9,3),
	tien_coc DECIMAL(9,3),
	ghichu NVARCHAR(255)
	PRIMARY KEY (isbn, ma_cuonsach, ngay_muon),
	CONSTRAINT qtrinhmuon_counsach_fk
	FOREIGN KEY (isbn, ma_cuonsach) REFERENCES cuonsach(isbn,ma_cuonsach)
)
GO