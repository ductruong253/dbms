/*
He quan tri CSDL - Lab 06 - TRIGGERS
DTTX - HK1 / 2022-2023
MSSV: 20880108
Ho va Ten: Dang Duc Truong
Email: 20880108@student.hcmus.edu.vn
*/

/*
BT6.1 tg_delMuon:
Noi dung: Trigger tren quan he Muon, khi co thao tac xoa 1 dong trong quan he, 
hay cap nhat tinh trang cua cuon sach tuong ung trong quan he Cuon sach la gia tri Y.
*/

USE quanLyThuVien
GO

DROP TRIGGER IF EXISTS trigger_xoa_qhMuon
GO
CREATE TRIGGER trigger_xoa_qhMuon
ON muon
AFTER DELETE
AS
	BEGIN
		UPDATE cuonsach
		SET tinhtrang = 'Y'
		WHERE cuonsach.isbn IN (SELECT isbn FROM deleted)
		AND cuonsach.ma_cuonsach IN (SELECT ma_cuonsach FROM deleted)
		PRINT 'trigger_xoa_qhMuon: Da cap nhat trang thai cuon sach tuong ung'
	END
GO

/*
BT6.2. tg_insMuon:
Noi dung: Trigger tren quan he Muon, khi co thao tac them 1 dong trong quan he, 
hay cap nhat tinh trang cua cuon sach tuong ung trong quan he Cuon sach la gia tri N.
*/

DROP TRIGGER IF EXISTS trigger_them_qhMuon
GO
CREATE TRIGGER trigger_them_qhMuon
ON muon
AFTER INSERT
AS
	BEGIN
		UPDATE cuonsach
		SET tinhtrang = 'N'
		WHERE cuonsach.isbn IN (SELECT isbn FROM inserted)
		AND cuonsach.ma_cuonsach IN (SELECT ma_cuonsach FROM inserted)
		PRINT 'trigger_them_qhMuon: Da cap nhat trang thai cuon sach tuong ung'
	END
GO