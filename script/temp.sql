/****** Script for SelectTopNRows command from SSMS  ******/
UPDATE cuonsach
SET tinhtrang = 'N'
WHERE cuonsach.ma_cuonsach = '1';
SELECT * FROM cuonsach WHERE cuonsach.tinhtrang='Y';

SELECT temp1.isbn, COUNT(*) AS so_sach_con_lai FROM
		(SELECT * FROM cuonsach cs
			WHERE cs.tinhtrang='Y') temp1
	GROUP BY temp1.isbn

SELECT cs.isbn, SUM(CASE tinhtrang WHEN 'Y' then 1 ELSE 0 END) AS so_sach_con_lai
FROM cuonsach cs
GROUP BY cs.isbn

SELECT * FROM cuonsach cs
WHERE cs.tinhtrang='Y'

SELECT * FROM qtrinhmuon qt;

SELECT * FROM muon m JOIN treem te
ON m.ma_docgia = te.ma_docgia_nglon


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

SELECT * FROM muon;
SELECT * FROM qtrinhmuon;

select
    t1.isbn
    ,t2.tra
    ,t1.muon
from (SELECT m.isbn, COUNT(*) AS muon FROM muon m GROUP BY m.isbn) t1
full join (SELECT qt.isbn, COUNT(*) AS tra FROM qtrinhmuon qt GROUP BY qt.isbn) t2
on t1.muon = t2.muon and t1.tra = t2.tra

SELECT * FROM
(SELECT m.isbn, COUNT(*) AS muon FROM muon m GROUP BY m.isbn) t1
JOIN
(SELECT qt.isbn, COUNT(*) AS tra FROM qtrinhmuon qt GROUP BY qt.isbn) t2
ON t1.muon = t2.muon AND t1.tra=t2.tra;

SELECT * FROM
(SELECT m.isbn, COUNT(*) AS muon FROM muon m GROUP BY m.isbn) muon
FULL OUTER JOIN
(SELECT qt.isbn, COUNT(*) AS tra FROM qtrinhmuon qt GROUP BY qt.isbn) tra
ON muon.isbn = tra.isbn;


WITH t1 AS (SELECT m.isbn, COUNT(*) AS muon FROM muon m GROUP BY m.isbn),
t2 AS (SELECT qt.isbn, COUNT(*) AS tra FROM qtrinhmuon qt GROUP BY qt.isbn)
SELECT t1.isbn, t1.muon, t2.tra
FROM 

SELECT m.isbn, COUNT(*) AS muon FROM muon m GROUP BY m.isbn
UNION ALL
SELECT qt.isbn, COUNT(*) AS tra FROM qtrinhmuon qt GROUP BY qt.isbn

SELECT m.isbn, m.ma_cuonsach, m.ma_docgia, DATEDIFF(day, m.ngay_muon, m.ngay_hethan) AS ngay FROM muon m

SELECT *, DATEDIFF(day, qtrinhmuon.ngay_hethan, qtrinhmuon.ngay_tra) AS so_ngay_tre
FROM qtrinhmuon
WHERE DATEDIFF(day, qtrinhmuon.ngay_hethan, qtrinhmuon.ngay_tra) > 0;

SELECT DISTINCT te.ma_docgia_nglon FROM treem te
	JOIN muon m
	ON te.ma_docgia = m.ma_docgia

SELECT * FROM nguoilon nl
JOIN muon m ON nl.ma_docgia = m.ma_docgia
WHERE nl.ma_docgia IN (SELECT DISTINCT te.ma_docgia_nglon FROM treem te
	JOIN muon m
	ON te.ma_docgia = m.ma_docgia)

SELECT * FROM nguoilon nl
SELECT * FROM treem te
SELECT * FROM muon m