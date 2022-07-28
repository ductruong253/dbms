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
ALTER PROC sp_CapNhatTrangThaiDauSach (@isbn INT)
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
ALTER PROC sp_ThemTuaSach(@tuasach NVARCHAR(63), @tacgia NVARCHAR(31), @tomtat NVARCHAR(16))
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
CREATE PROC sp_ThemCuonSach (@isbn INT, @tinhtrang NCHAR(1))
AS
BEGIN
	SELECT * FROM dausach ds
	WHERE ds.isbn = @isbn;
	IF @@ROWCOUNT > 0
	BEGIN
		DECLARE @ma_cuonsach SMALLINT = 1;
	END
	ELSE
	BEGIN
		PRINT 'ISBN khong ton tai'
	END
END