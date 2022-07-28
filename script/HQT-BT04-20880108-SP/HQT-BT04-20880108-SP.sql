/*
He quan tri CSDL - Lab 04 - STORED PROCEDURE
DTTX - HK1 / 2022-2023
MSSV: 20880108
Ho va Ten: Dang Duc Truong
Email: 20880108@student.hcmus.edu.vn
*/

USE quanLyThuVien
GO

/*------------------------------------------------------Stored procedure BT4-6-------------------------------------------------------*/
/*Cập nhật trạng thái của một đầu sách cụ thể theo isbn: nếu đầu sách không còn cuốn sách nào trong thư viện thì tình trạng là "no",
ngược lại có ít nhất 1 cuốn thì tình trạng là "yes"*/
CREATE PROC sp_CapNhatTrangThaiDauSach (@isbn INT)
AS
BEGIN
	SELECT * FROM cuonsach cs
	WHERE cs.isbn = @isbn;
	IF @@ROWCOUNT > 0
	BEGIN
		UPDATE dausach
		SET trangthai = 'Y'
		WHERE isbn = @isbn
		PRINT 'yes'
	END
	ELSE
	BEGIN
		UPDATE dausach
		SET trangthai = 'N'
		WHERE isbn = @isbn
		PRINT 'no'
	END
END
GO
/*Kiem tra sp_CapNhatTrangThaiDauSach*/
DECLARE @isbn INT;
EXEC sp_CapNhatTrangThaiDauSach @isbn = 1094;
GO

/*------------------------------------------------------Stored procedure BT4-7-------------------------------------------------------*/
/*Them tua sach vao he thong voi dieu kien la bo 3 thuoc tinh 'tuasach', 'tacgia', 'tomtat' phai khac voi cac bo trong bang tua sach da co
va phai dam bao QD-2 duoc tuan thu
*/
CREATE PROC sp_ThemTuaSach(@tuasach NVARCHAR(63), @tacgia NVARCHAR(31), @tomtat NVARCHAR(16))
AS
BEGIN
	SELECT * FROM tuasach ts
	WHERE ts.tacgia = @tacgia AND ts.tuasach = @tuasach AND ts.tomtat = @tomtat;
	IF @@ROWCOUNT = 0
	BEGIN
		DECLARE @ma_tuasach INT = 1;
		WHILE @ma_tuasach IN (SELECT ts.ma_tuasach FROM tuasach ts)
		BEGIN
			SET @ma_tuasach = @ma_tuasach + 1;
		END
		INSERT INTO tuasach (ma_tuasach, tuasach, tacgia, tomtat)
		VALUES (@ma_tuasach, @tuasach, @tacgia, @tomtat);
	END
	ELSE
	BEGIN
		PRINT 'Dau sach da ton tai';
	END
END
/*Kiem tra sp_ThemTuaSach*/
EXEC sp_ThemTuaSach @tuasach = 'The Night-Born', @tacgia = 'Jack Londond', @tomtat = N'Tóm tắt 2';
/*------------------------------------------------------Stored procedure BT4-8-------------------------------------------------------*/
/*Them cuon sach vao he thong voi dieu kien phai dam bao quy dinh QD-2 duoc tuan thu. Va phai cap nhat trang thai cua dau sach*/
CREATE PROC sp_ThemCuonSach (@isbn INT)
AS
BEGIN
	SELECT * FROM dausach ds
	WHERE ds.isbn = @isbn;
	IF @@ROWCOUNT > 0
	BEGIN
		DECLARE @ma_cuonsach SMALLINT = 1;
		WHILE @ma_cuonsach IN (SELECT cs.ma_cuonsach FROM cuonsach cs WHERE cs.isbn = @isbn)
		BEGIN
			SET @ma_cuonsach = @ma_cuonsach + 1;
		END
		INSERT INTO cuonsach (isbn, ma_cuonsach, tinhtrang)
		VALUES (@isbn, @ma_cuonsach, 'Y');
		UPDATE dausach
		SET trangthai = 'Y'
		WHERE isbn = @isbn;
	END
	ELSE
	BEGIN
		PRINT 'ISBN khong ton tai'
	END
END

/*Kiem tra sp_ThemCuonSach*/
EXEC sp_ThemCuonSach @isbn=1094;
GO

/*------------------------------------------------------Stored procedure BT4-9-------------------------------------------------------*/
/*Them thong tin moi vao bang du lieu nguoi lon va bang du lieu doc gia cua he thong*/
CREATE PROC sp_ThemNguoiLon (
			@ho NVARCHAR(15),
			@tenlot CHAR(1),
			@ten NVARCHAR(15),
			@ngay_sinh DATETIME,
			@sonha NVARCHAR(15),
			@duong NVARCHAR(63),
			@quan CHAR(2),
			@dienthoai CHAR(13))
AS
BEGIN
	DECLARE @ma_docgia SMALLINT = 1;
	WHILE @ma_docgia IN (SELECT ma_docgia FROM docgia)
	BEGIN
		SET @ma_docgia = @ma_docgia + 1;
	END
	INSERT INTO docgia (ma_docgia, ho, tenlot, ten, ngay_sinh)
	VALUES (@ma_docgia, @ho, @tenlot, @ten, @ngay_sinh);
	DECLARE @tuoi INT = DATEDIFF(hour, @ngay_sinh, GETDATE())/8766;
	PRINT @tuoi;
	IF (@tuoi >= 18)
	BEGIN
		PRINT 'Doc gia la nguoi lon';
		INSERT INTO nguoilon (ma_docgia, sonha, duong, quan, dienthoai, han_sd)
		VALUES (@ma_docgia, @sonha, @duong, @quan, @dienthoai, GETDATE() + 365);
	END
	ELSE
	BEGIN
		PRINT 'Chua du 18 tuoi';
	END
END

/*Kiem tra sp_ThemNguoiLon*/
EXEC sp_ThemNguoiLon @ho = 'Le', @tenlot = 'V', @ten = 'Dung', @ngay_sinh = '2004-07-29',
					@sonha = '45', @duong = 'Thong Nhat', @quan = 'GV', @dienthoai = null;
EXEC sp_ThemNguoiLon @ho = 'Le', @tenlot = 'V', @ten = 'Manh', @ngay_sinh = '2004-07-28',
					@sonha = '45', @duong = 'Thong Nhat', @quan = 'GV', @dienthoai = null;

/*------------------------------------------------------Stored procedure BT4-10-------------------------------------------------------*/
/*Them thong tin moi vao bang du lieu tre em va bang du lieu doc gia cua he thong*/
CREATE PROC sp_ThemTreEm (
			@ho NVARCHAR(15),
			@tenlot CHAR(1),
			@ten NVARCHAR(15),
			@ngay_sinh DATETIME,
			@ma_docgia_nglon SMALLINT)
AS
BEGIN
	DECLARE @ma_docgia SMALLINT = 1;
	WHILE @ma_docgia IN (SELECT ma_docgia FROM docgia)
	BEGIN
		SET @ma_docgia = @ma_docgia + 1;
	END
	INSERT INTO docgia (ma_docgia, ho, tenlot, ten, ngay_sinh)
	VALUES (@ma_docgia, @ho, @tenlot, @ten, @ngay_sinh);
	SELECT * FROM treem te
	WHERE te.ma_docgia_nglon = @ma_docgia_nglon
	IF (@@ROWCOUNT <2)
	BEGIN
		INSERT INTO treem (ma_docgia, ma_docgia_nglon)
		VALUES (@ma_docgia, @ma_docgia_nglon);
	END
	ELSE
	BEGIN	
		PRINT 'nguoi lon nay da vuot qua so luong tre em duoc phep bao lanh';
	END
END
/*Kiem tra sp_ThemTreEm*/
EXEC sp_ThemTreEm @ho = 'Le', @tenlot = 'V', @ten = 'Dung', @ngay_sinh = '2004-07-29',
					@ma_docgia_nglon = 32;