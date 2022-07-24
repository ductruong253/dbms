/*
He quan tri CSDL - Lab 03 - STORED PROCEDURE
DTTX - HK1 / 2022-2023
MSSV: 20880108
Ho va Ten: Dang Duc Truong
Email: 20880108@student.hcmus.edu.vn
*/

USE quanLyThuVien
GO

/*------------------------------------------------------Stored procedure BT3-1-------------------------------------------------------*/
/*Kiểm tra mã độc giả có tồn tại không?*/
CREATE PROC kiemTraMaDocGia (@id INT, @coTonTai BIT OUTPUT)
AS
BEGIN
	SELECT * FROM docgia dg
	WHERE dg.ma_docgia = @id;
	IF (@@ROWCOUNT = 1)
	BEGIN
		SELECT @coTonTai = 1;
	END
	ELSE
	BEGIN
		SELECT @coTonTai = 0;
	END
END
GO

/*Kiem tra sp kiemTraMaDocGia*/
DECLARE @result BIT
EXEC kiemTraMaDocGia @id = 111, @coTonTai = @result OUTPUT
SELECT @result AS 'Ket qua'
GO

/*Stored procedure BT3-1*/
CREATE PROC sp_ThongTinDocGia (@ma_dg INT)
AS
BEGIN
	/*[0] Kiem tra ma doc gia co ton tai hay khong*/
	DECLARE @checkTonTai BIT;
	EXEC kiemTraMaDocGia @id = @ma_dg, @coTonTai = @checkTonTai OUTPUT;
	/*[1] Neu ma doc gia ton tai*/
	IF (@checkTonTai = 1)
	BEGIN
		/*[1.1] Kiem tra doc gia la nguoi lon hay tre em*/
		SELECT * FROM nguoilon nl
		WHERE nl.ma_docgia = @ma_dg
		/*[1.2] Neu doc gia la nguoi lon*/
		IF (@@ROWCOUNT = 1)
		BEGIN
			PRINT 'Doc gia la nguoi lon';
			/*[1.2.1] In thong tin lien quan den doc gia nguoi lon*/
			SELECT * FROM nguoilon nl
			JOIN docgia dg
			ON nl.ma_docgia = dg.ma_docgia
			WHERE nl.ma_docgia = @ma_dg;
		END
		ELSE
		BEGIN
			PRINT 'Doc gia la tre em';
			/*[1.2.1] In thong tin lien quan den doc gia tre em*/
			SELECT * FROM treem te
			JOIN docgia dg
			ON te.ma_docgia = dg.ma_docgia
			WHERE te.ma_docgia = @ma_dg;
		END
	END
	/*[2] Neu ma doc gia khong ton tai*/
	ELSE
	BEGIN
		/*Thong bao loi*/
		PRINT 'Doc gia khong ton tai'
	END
END

/*Kiem tra sp_ThongTinDocGia*/
EXEC sp_ThongTinDocGia @ma_dg = 2
GO
/*------------------------------------------------------Stored procedure BT3-2-------------------------------------------------------*/
/*Liet ke nhung thong tin cua dau sach, thong tin tua sach va so luong sach hien chua duoc muon cua 1 dau sach cu the*/
CREATE PROC sp_ThongTinDauSach (@isbn INT)
AS
BEGIN
	SELECT ds.isbn,
			ds.ma_tuasach,
			ds.ngonngu,
			ds.bia,
			ts.tuasach,
			ts.tacgia,
			ts.tomtat,
			tk.so_sach_chua_muon
	FROM dausach ds JOIN
		(SELECT cs.isbn, COUNT(*) AS so_sach_chua_muon FROM cuonsach cs
		WHERE cs.tinhtrang = 'Y'
		GROUP BY cs.isbn) tk
	ON ds.isbn = tk.isbn
	JOIN tuasach ts
	ON ds.ma_tuasach = ts.ma_tuasach
	WHERE ds.isbn = @isbn
END

/* Kiem tra sp_ThongTinDauSach*/
EXEC sp_ThongTinDauSach @isbn = 1073
GO
/*------------------------------------------------------Stored procedure BT3-3-------------------------------------------------------*/
/*Liet ke nhung thong tin cua tat ca doc gia nguoi lon dang muon sach cua thu vien*/
CREATE PROC sp_ThongTinNguoiLonDangMuon
AS
BEGIN
	SELECT dg.ma_docgia,
			dg.ho + COALESCE(' ' + dg.tenlot + ' ',' ') + dg.ten AS ho_ten,
			dg.ngay_sinh,
			nl.sonha,
			nl.duong,
			nl.quan,
			nl.dienthoai,
			nl.han_sd,
			m.sl_muon
	FROM docgia dg
	JOIN nguoilon nl
	ON dg.ma_docgia = nl.ma_docgia
	JOIN
		(SELECT muon.ma_docgia, COUNT(*) AS sl_muon
		FROM muon
		GROUP BY muon.ma_docgia) m
	ON m.ma_docgia = dg.ma_docgia
END

/* Kiem tra sp_ThongTinNguoiLonDangMuon*/
EXEC sp_ThongTinNguoiLonDangMuon
GO
/*------------------------------------------------------Stored procedure BT3-4-------------------------------------------------------*/
/*Liet ke nhung thong tin cua tat ca doc gia nguoi lon dang muon sach cua thu vien dang trong tinh trang muon qua han (theo quy dinh la 14 ngay)*/
CREATE PROC sp_ThongTinNguoiLonQuaHan
AS
BEGIN
	SELECT dg.ma_docgia,
			dg.ho + COALESCE(' ' + dg.tenlot + ' ',' ') + dg.ten AS ho_ten,
			dg.ngay_sinh,
			nl.sonha,
			nl.duong,
			nl.quan,
			nl.dienthoai,
			nl.han_sd,
			nt.isbn, nt.ma_cuonsach,
			nt.so_ngay_tre
	FROM docgia dg
	JOIN nguoilon nl ON dg.ma_docgia = nl.ma_docgia
	JOIN 
		(SELECT qt.ma_docgia, qt.isbn, qt.ma_cuonsach, DATEDIFF(day, qt.ngay_hethan, qt.ngay_tra) AS so_ngay_tre
		FROM qtrinhmuon qt
		WHERE DATEDIFF(day, qt.ngay_hethan, qt.ngay_tra) > 0) nt
	ON dg.ma_docgia = nt.ma_docgia
END
/* Kiem tra sp_ThongTinNguoiLonQuaHan*/
EXEC sp_ThongTinNguoiLonQuaHan
GO
/*------------------------------------------------------Stored procedure BT3-4-------------------------------------------------------*/
/*Liet ke nhung doc gia dang trong tinh trang muon sach va nhung tre em doc gia nay dang bao lanh cung dang trong tinh trang muon sach*/
CREATE PROC sp_DocGiaCoTreEmMuon
AS
BEGIN
	SELECT dg.ma_docgia,
			dg.ho + COALESCE(' ' + dg.tenlot + ' ',' ') + dg.ten AS ho_ten_nglon,
			dg.ngay_sinh,
			nl.sonha,
			nl.duong,
			nl.quan,
			nl.dienthoai,
			nl.han_sd,
			m.isbn, m.ma_cuonsach,
			te.ma_docgia AS treem_dang_baolanh_co_muon_sach
	FROM nguoilon nl
	JOIN muon m ON nl.ma_docgia = m.ma_docgia
	JOIN treem te ON te.ma_docgia_nglon = nl.ma_docgia
	JOIN docgia dg ON dg.ma_docgia = nl.ma_docgia
	WHERE nl.ma_docgia IN (SELECT DISTINCT te.ma_docgia_nglon FROM treem te
		JOIN muon m
		ON te.ma_docgia = m.ma_docgia)
END
/* Kiem tra sp_ThongTinNguoiLonQuaHan*/
EXEC SP_DocGiaCoTreEmMuon