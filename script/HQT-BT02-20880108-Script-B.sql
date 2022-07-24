/*
He quan tri CSDL - Lab 02 - NHOM B
DTTX - HK1 / 2022-2023
MSSV: 20880108
Ho va Ten: Dang Duc Truong
Email: 20880108@student.hcmus.edu.vn
*/

/* 1) Liệt kê danh sách họ tên và mã độc giả người lớn đang mượn sách chưa trả và số
lượng sách họ đang mượn*/

SELECT *, COUNT(*) AS so_sach_chua_tra FROM 
	(SELECT dg.ma_docgia,
			dg.ho + COALESCE(' ' + dg.tenlot + ' ',' ') + dg.ten AS ho_ten
	FROM muon m JOIN nguoilon nl
	ON m.ma_docgia = nl.ma_docgia
	JOIN docgia dg
	ON dg.ma_docgia=nl.ma_docgia) temp
GROUP BY temp.ma_docgia, temp.ho_ten;

/* 2) Liệt kê danh sách họ tên và mã độc giả người lớn đang mượn sách trể hạn (so với
quy định) */


/* 3) Liệt kê danh sách họ tên đọc giả trẻ em đang mượn sách chưa trả và tên đầu sách
mà trẻ em đang mượn */
SELECT dg.ho + COALESCE(' ' + dg.tenlot + ' ',' ') + dg.ten AS ho_ten,
		m.isbn
FROM muon m
JOIN treem te ON m.ma_docgia = te.ma_docgia
JOIN docgia dg ON dg.ma_docgia = te.ma_docgia;

/* 4) Liệt kê danh sách các độc giả người lớn đang mượn sách chưa trả đồng thời trẻ em
mà người lớn đó đang bảo lãnh cũng có mượn sách chưa trả.*/
SELECT dg.ma_docgia,
	dg.ho + COALESCE(' ' + dg.tenlot + ' ',' ') + dg.ten AS ho_ten
FROM
(
	SELECT te.ma_docgia FROM treem te JOIN muon m
	ON te.ma_docgia = m.ma_docgia
	WHERE te.ma_docgia_nglon IN (SELECT DISTINCT dg.ma_docgia FROM docgia dg)
	UNION
	SELECT te.ma_docgia_nglon FROM treem te JOIN muon m
	ON te.ma_docgia = m.ma_docgia
	WHERE te.ma_docgia_nglon IN (SELECT DISTINCT dg.ma_docgia FROM docgia dg)
) temp
JOIN docgia dg ON dg.ma_docgia = temp.ma_docgia;

/* 5) Liệt kê danh sách độc giả đang đăng ký mượn sách mà tên đầu sách cần mượn */
SELECT dg.ma_docgia,
	dg.ho + COALESCE(' ' + dg.tenlot + ' ',' ') + dg.ten AS ho_ten,
	ts.tuasach
FROM docgia dg JOIN dangky dk
ON dg.ma_docgia = dk.ma_docgia
JOIN dausach ds ON ds.isbn = dk.isbn
JOIN tuasach ts ON ts.ma_tuasach = ds.ma_tuasach;

/* 6) Liệt kê danh sách độc giả đang đăng ký mượn sách và số lượng đầu sách đã đăng
ký. */
SELECT dg.ma_docgia,
	COUNT(*) AS so_luong_dk
FROM docgia dg JOIN dangky dk
ON dg.ma_docgia = dk.ma_docgia
GROUP BY dg.ma_docgia;
