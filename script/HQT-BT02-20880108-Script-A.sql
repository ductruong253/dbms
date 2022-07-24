/*
He quan tri CSDL - Lab 02 - NHOM A
DTTX - HK1 / 2022-2023
MSSV: 20880108
Ho va Ten: Dang Duc Truong
Email: 20880108@student.hcmus.edu.vn
*/

USE quanLyThuVien
GO

/* 1) Liệt kê danh sách độc giả có mã độc giả trong khoảng từ 25 đến 88 */
SELECT * FROM docgia
WHERE docgia.ma_docgia BETWEEN 25 AND 88;

/* 2) Liệt kê danh sách độc giả người lớn có mã độc giả trong khoảng 25 đến 88 (Mã độc
giả, họ tên, ngày sinh, điện thoại, hạn sử dụng)*/
SELECT dg.ma_docgia,
		dg.ho + COALESCE(' ' + dg.tenlot + ' ',' ') + dg.ten AS ho_ten,
		dg.ngay_sinh, nl.dienthoai,
		nl.han_sd
FROM docgia dg JOIN nguoilon nl
ON dg.ma_docgia = nl.ma_docgia
WHERE dg.ma_docgia BETWEEN 25 AND 88;

/* 3) Liệt kê họ tên độc giả trẻ em và họ tên độc giả người lớn đã bảo lãnh trẻ em đó có
địa chỉ nhà ở quận 1, 6, 7, BT và GV*/
SELECT dg.ho + COALESCE(' ' + dg.tenlot + ' ',' ') + dg.ten AS ho_ten FROM docgia dg JOIN
	(SELECT te.ma_docgia FROM treem te JOIN nguoilon nl
		ON te.ma_docgia_nglon = nl.ma_docgia
		JOIN docgia dg ON dg.ma_docgia = te.ma_docgia
		WHERE nl.quan IN ('1', '6', '7', 'BT', 'GV')
	UNION
	SELECT nl.ma_docgia FROM treem te JOIN nguoilon nl
		ON te.ma_docgia_nglon = nl.ma_docgia
		JOIN docgia dg ON dg.ma_docgia = te.ma_docgia
		WHERE nl.quan IN ('1', '6', '7', 'BT', 'GV')) temp
ON dg.ma_docgia = temp.ma_docgia;

/* 4) Liệt kê danh sách họ tên và mã độc giả không có bảo lãnh trẻ em */
SELECT dg.ma_docgia, dg.ho + COALESCE(' ' + dg.tenlot + ' ',' ') + dg.ten AS ho_ten FROM docgia dg
JOIN (SELECT nl.ma_docgia FROM nguoilon nl
		WHERE nl.ma_docgia NOT IN (SELECT te.ma_docgia_nglon FROM treem te)) temp
ON dg.ma_docgia = temp.ma_docgia;

/* 5) Liêt kê tất cả họ tên đọc giả người lớn có trong hệ thống và số lượng trẻ em mà họ
bảo lãnh (nếu có)*/
SELECT dg.ho + COALESCE(' ' + dg.tenlot + ' ',' ') + dg.ten AS ho_ten, temp.so_tre_em
FROM docgia dg JOIN 
	(SELECT te.ma_docgia_nglon, COUNT(te.ma_docgia) AS so_tre_em FROM treem te
	GROUP BY te.ma_docgia_nglon) temp
ON dg.ma_docgia = temp.ma_docgia_nglon;

/* 6) Liệt kê thông tin các đầu sách vẫn còn khả năng được mượn */
SELECT * FROM dausach ds WHERE ds.trangthai='Y';

/* 7) Với mỗi đầu sách, liệt kê thông tin đầu sách và số lượng cuốn sách vẫn còn trong
thư viện */
SELECT ds.isbn, ds.ma_tuasach, ds.ngonngu, ds.bia, temp2.so_sach_con_lai FROM dausach ds JOIN
	(SELECT cs.isbn, SUM(CASE tinhtrang WHEN 'Y' then 1 ELSE 0 END) AS so_sach_con_lai
	FROM cuonsach cs
	GROUP BY cs.isbn) temp2
ON temp2.isbn = ds.isbn;

/* 8) Với từng ngôn ngữ sách có trong hệ thống, cho biết tên ngôn ngữ và số lượng đầu
sách thuộc ngôn ngữ đó*/
SELECT ds.ngonngu, COUNT(*) AS so_dau_sach FROM dausach ds
GROUP BY ds.ngonngu;
