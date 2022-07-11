USE quanLyThuVien
GO

INSERT INTO docgia
VALUES (1, N'Phạm', 'V', N'Bảo', '1990/01/05'),
		(2, N'Võ', 'V', N'Dũng', '2010/01/01'),
		(3, N'Văn', 'P', N'Phúc', '1988/05/06'),
		(4, N'Bùi', 'N', N'Bình', '2011/08/09'),
		(5, N'Lê', 'V', N'Sang', '1982/09/26'),
		(6, N'Võ', 'H', N'Hà', '2012/12/07'),
		(7, N'Lê', 'B', N'Mộng', '1990/03/06'),
		(8, N'Vũ', 'C', N'Hường', '2010/07/08'),
		(9, N'Đinh', 'B', N'Hà', '1980/04/06'),
		(10, N'Hồ', 'V', N'My', '2011/08/12'),
		(11, N'Đinh', 'L', N'Mộng', '1970/06/09'),
		(12, N'Đỗ', 'B', N'Phương', '2012/07/15'),
		(13, N'Đồng', 'L', N'Bình', '1977/02/25'),
		(14, N'Thân', 'P', N'My', '2010/11/09'),
		(15, N'Phan', 'N', N'Mỹ', '1983/03/26'),
		(16, N'Lê', 'T', N'Tấn', '2011/01/12'),
		(17, N'Lê', 'T', N'Thịnh', '1980/03/15'),
		(18, N'Nguyễn', 'T', N'Trung', '2012/01/02'),
		(19, N'Nguyễn', 'T', N'Tiến', '1991/12/30'),
		(20, N'Lê', 'D', N'Tiền', '2010/03/04'),
		(21, N'Lê', 'D', N'Huy', '1980/02/07'),
		(22, N'Trương', 'N', N'Quỳnh', '2011/02/03'),
		(23, N'Trương', 'N', N'Thư', '1981/12/03'),
		(24, N'Phan', 'D', N'Quỳnh', '2012/12/11'),
		(25, N'Phan', 'D', 'Tân', '1990/12/12'),
		(26, N'Phan', 'D', 'Huy', '2010/06/12'),
		(27, N'Phan', 'D', 'Ích', '1990/11/12'),
		(28, N'Đào', 'C', N'Tí', '2011/11/17'),
		(29, N'Đào', 'C', N'Tèo', '1971/11/11'),
		(30, N'Đào', 'C', N'Sinh', '2012/12/13'),
		(31, N'Đào', 'C', N'Chuột', '1972/10/15')
GO

INSERT INTO nguoilon
VALUES (1, '10', N'Bùi Thị Xuân', '2', NULL, '2022/12/20'),
		(3, '20', N'Đinh Bộ Lĩnh', '4', NULL, '2022/12/22'),
		(5, '30', N'Dương Bá Trạc', '6', NULL, '2022/12/10'),
		(7, '40', N'Huỳnh Khương Ninh', '8', NULL, '2022/12/26'),
		(9, '50', N'Lê Lợi', '10', NULL, '2022/12/28'),
		(11, '60', N'Lê Thị Riêng', 'BT', NULL, '2022/12/30'),
		(13, '70', N'Nguyễn Trãi', 'GV', NULL, '2022/12/02'),
		(15, '80', N'Phạm Ngũ Lão', 'TD', NULL, '2022/12/04'),
		(17, '90', N'QL1A', 'BT', NULL, '2022/12/02'),
		(19, '91', N'QL1B', 'TB', NULL, '2020/12/03'),
		(21, '92', N'Nguyễn Bính', '9', NULL, '2022/12/31'),
		(23, '93', N'Nguyễn Đình Chiểu', '11', NULL, '2022/12/31'),
		(25, '94', N'Nguyễn Đình Chiểu', '11', NULL, '2022/12/31'),
		(27, '95', N'Nguyễn Đình Chiểu', '11', NULL, '2022/12/31'),
		(29, '96', N'Nguyễn Đình Chiểu', '11', NULL, '2022/12/31'),
		(31, '97', N'Nguyễn Đình Chiểu', '11', NULL, '2022/12/31')
GO

INSERT INTO treem
VALUES (2, 1),
		(4, 1),
		(6, 3),
		(8, 3),
		(10, 5),
		(12, 5),
		(14, 7),
		(16, 17),
		(18, 19),
		(20, 21),
		(22, 23),
		(24, 25),
		(26, 27),
		(28, 29),
		(30, 31)
GO

INSERT INTO tuasach
VALUES (1, 'Last of the Mohicans', 'James Fenimore Cooper', N'Tóm tắt 1'),
		(2, 'The Night-Born', 'Jack London', N'Tóm tắt 2'),
		(3, 'Lemon', 'Motojirou', N'Tóm tắt 3'),
		(4, 'Walking', 'Henry David Thoreau', N'Tóm tắt 4'),
		(5, N'Ăn mày dĩ vãng', 'Chu Lai', N'Tóm tắt 5'),
		(6, N'Mình cưới nhau đi', N'Khắc Hoàng', N'Tóm tắt 6'),
		(7, N'Du lịch sao Hỏa', N'Khắc Ngáo', N'Tóm tắt 7'),
		(8, N'Lao vào đoàn xe tăng', N'Khắc Chân', N'Tóm tắt 8'),
		(9, N'Chui vào lòng đất', N'Khải Hoàng', N'Tóm tắt 9')
GO

INSERT INTO dausach
VALUES (1011, 1, N'Tiếng Anh', N'Bìa mềm', 'Y'),
		(1012, 1, N'Tiếng Pháp', N'Bìa mềm', 'Y'),
		(1013, 1, N'Tiếng Việt', N'Bìa cứng', 'Y'),
		(1021, 2, N'Tiếng Anh', N'Bìa mềm', 'Y'),
		(1022, 2, N'Tiếng Pháp', N'Bìa mềm', 'Y'),
		(1023, 2, N'Tiếng Việt', N'Bìa cứng', 'Y'),
		(1031, 3, N'Tiếng Anh', N'Bìa mềm', 'Y'),
		(1032, 3, N'Tiếng Pháp', N'Bìa mềm', 'Y'),
		(1033, 3, N'Tiếng Việt', N'Bìa cứng', 'Y'),
		(1041, 4, N'Tiếng Anh', N'Bìa mềm', 'Y'),
		(1042, 4, N'Tiếng Pháp', N'Bìa mềm', 'Y'),
		(1043, 4, N'Tiếng Việt', N'Bìa cứng', 'Y'),
		(1051, 5, N'Tiếng Anh', N'Bìa mềm', 'Y'),
		(1052, 5, N'Tiếng Pháp', N'Bìa mềm', 'Y'),
		(1053, 5, N'Tiếng Việt', N'Bìa cứng', 'Y'),
		(1061, 6, N'Tiếng Anh', N'Bìa mềm', 'N'),
		(1062, 6, N'Tiếng Pháp', N'Bìa mềm', 'N'),
		(1063, 6, N'Tiếng Việt', N'Bìa cứng', 'N'),
		(1071, 7, N'Tiếng Anh', N'Bìa mềm', 'Y'),
		(1072, 7, N'Tiếng Pháp', N'Bìa mềm', 'Y'),
		(1073, 7, N'Tiếng Việt', N'Bìa cứng', 'Y'),
		(1081, 8, N'Tiếng Anh', N'Bìa mềm', 'Y'),
		(1082, 8, N'Tiếng Pháp', N'Bìa mềm', 'Y'),
		(1083, 8, N'Tiếng Việt', N'Bìa cứng', 'Y'),
		(1091, 9, N'Tiếng Anh', N'Bìa mềm', 'Y'),
		(1092, 9, N'Tiếng Pháp', N'Bìa mềm', 'Y'),
		(1093, 9, N'Tiếng Việt', N'Bìa cứng', 'Y')
GO

insert into CUON_SACH values (1011, 1, 'Y')
insert into CUON_SACH values (1011, 2, 'N')
insert into CUON_SACH values (1011, 3, 'N')
insert into CUON_SACH values (1012, 1, 'Y')
insert into CUON_SACH values (1012, 2, 'N')
insert into CUON_SACH values (1012, 3, 'N')
insert into CUON_SACH values (1013, 1, 'Y')
insert into CUON_SACH values (1013, 2, 'N')
insert into CUON_SACH values (1013, 3, 'N')
insert into CUON_SACH values (1021, 1, 'Y')
insert into CUON_SACH values (1021, 2, 'N')
insert into CUON_SACH values (1021, 3, 'N')
insert into CUON_SACH values (1022, 1, 'Y')
insert into CUON_SACH values (1022, 2, 'N')
insert into CUON_SACH values (1022, 3, 'N')
insert into CUON_SACH values (1023, 1, 'Y')
insert into CUON_SACH values (1023, 2, 'N')
insert into CUON_SACH values (1023, 3, 'N')
insert into CUON_SACH values (1031, 1, 'Y')
insert into CUON_SACH values (1031, 2, 'N')
insert into CUON_SACH values (1031, 3, 'N')
insert into CUON_SACH values (1032, 1, 'Y')
insert into CUON_SACH values (1032, 2, 'N')
insert into CUON_SACH values (1032, 3, 'N')
insert into CUON_SACH values (1033, 1, 'Y')
insert into CUON_SACH values (1033, 2, 'N')
insert into CUON_SACH values (1033, 3, 'N')
insert into CUON_SACH values (1041, 1, 'Y')
insert into CUON_SACH values (1041, 2, 'N')
insert into CUON_SACH values (1041, 3, 'N')
insert into CUON_SACH values (1042, 1, 'Y')
insert into CUON_SACH values (1042, 2, 'N')
insert into CUON_SACH values (1042, 3, 'N')
insert into CUON_SACH values (1043, 1, 'Y')
insert into CUON_SACH values (1043, 2, 'N')
insert into CUON_SACH values (1043, 3, 'N')
insert into CUON_SACH values (1051, 1, 'Y')
insert into CUON_SACH values (1051, 2, 'N')
insert into CUON_SACH values (1051, 3, 'N')
insert into CUON_SACH values (1052, 1, 'Y')
insert into CUON_SACH values (1052, 2, 'N')
insert into CUON_SACH values (1052, 3, 'N')
insert into CUON_SACH values (1053, 1, 'Y')
insert into CUON_SACH values (1053, 2, 'N')
insert into CUON_SACH values (1053, 3, 'N')
insert into CUON_SACH values (1061, 1, 'N')
insert into CUON_SACH values (1061, 2, 'N')
insert into CUON_SACH values (1061, 3, 'N')
insert into CUON_SACH values (1062, 1, 'N')
insert into CUON_SACH values (1062, 2, 'N')
insert into CUON_SACH values (1062, 3, 'N')
insert into CUON_SACH values (1063, 1, 'N')
insert into CUON_SACH values (1063, 2, 'N')
insert into CUON_SACH values (1063, 3, 'N')
insert into CUON_SACH values (1071, 1, 'Y')
insert into CUON_SACH values (1071, 2, 'Y')
insert into CUON_SACH values (1071, 3, 'Y')
insert into CUON_SACH values (1072, 1, 'Y')
insert into CUON_SACH values (1072, 2, 'Y')
insert into CUON_SACH values (1072, 3, 'Y')
insert into CUON_SACH values (1073, 1, 'Y')
insert into CUON_SACH values (1073, 2, 'Y')
insert into CUON_SACH values (1073, 3, 'Y')
insert into CUON_SACH values (1081, 1, 'Y')
insert into CUON_SACH values (1081, 2, 'Y')
insert into CUON_SACH values (1081, 3, 'Y')
insert into CUON_SACH values (1082, 1, 'Y')
insert into CUON_SACH values (1082, 2, 'Y')
insert into CUON_SACH values (1082, 3, 'Y')
insert into CUON_SACH values (1083, 1, 'Y')
insert into CUON_SACH values (1083, 2, 'Y')
insert into CUON_SACH values (1083, 3, 'Y')
insert into CUON_SACH values (1091, 1, 'Y')
insert into CUON_SACH values (1091, 2, 'Y')
insert into CUON_SACH values (1091, 3, 'Y')
insert into CUON_SACH values (1092, 1, 'Y')
insert into CUON_SACH values (1092, 2, 'Y')
insert into CUON_SACH values (1092, 3, 'Y')
insert into CUON_SACH values (1093, 1, 'Y')
insert into CUON_SACH values (1093, 2, 'Y')
insert into CUON_SACH values (1093, 3, 'Y')

insert into MUON values (1011, 2, 1, '2022/07/09', '2022/07/23')
insert into MUON values (1011, 3, 2, '2022/07/09', '2022/07/23')
insert into MUON values (1012, 2, 4, '2022/07/09', '2022/07/23')
insert into MUON values (1012, 3, 3, '2022/06/08', '2022/06/22')
insert into MUON values (1013, 2, 6, '2022/06/08', '2022/06/22')
insert into MUON values (1013, 3, 8, '2022/06/09', '2022/06/23')
insert into MUON values (1021, 2, 5, '2022/06/09', '2022/06/23')
insert into MUON values (1021, 3, 10, '2022/06/09', '2022/06/23')
insert into MUON values (1022, 2, 12, '2022/06/09', '2022/06/23')
insert into MUON values (1022, 3, 7, '2022/06/09', '2022/06/23')
insert into MUON values (1023, 2, 14, '2022/06/08', '2022/06/22')
insert into MUON values (1023, 3, 15, '2022/06/08', '2022/06/22')
insert into MUON values (1031, 2, 1, '2022/06/08', '2022/06/22')
insert into MUON values (1031, 3, 3, '2022/07/08', '2022/07/22')
insert into MUON values (1032, 2, 5, '2022/07/08', '2022/07/22')
insert into MUON values (1032, 3, 7, '2022/07/08', '2022/07/22')
insert into MUON values (1033, 2, 7, '2022/07/08', '2022/07/22')
insert into MUON values (1033, 3, 15, '2022/07/08', '2022/07/22')
insert into MUON values (1041, 2, 1, '2022/07/08', '2022/07/22')
insert into MUON values (1041, 3, 3, '2022/07/08', '2022/07/22')
insert into MUON values (1042, 2, 5, '2022/07/08', '2022/07/22')
insert into MUON values (1042, 3, 7, '2022/07/08', '2022/07/22')
insert into MUON values (1043, 2, 15, '2022/07/08', '2022/07/22')
insert into MUON values (1043, 3, 17, '2022/07/08', '2022/07/22')
insert into MUON values (1051, 2, 15, '2022/07/08', '2022/07/22')
insert into MUON values (1051, 3, 17, '2022/07/08', '2022/07/22')
insert into MUON values (1052, 2, 15, '2022/07/08', '2022/07/22')
insert into MUON values (1052, 3, 17, '2022/07/08', '2022/07/22')
insert into MUON values (1053, 2, 19, '2022/07/08', '2022/07/22')
insert into MUON values (1053, 3, 17, '2022/07/08', '2022/07/22')
insert into MUON values (1061, 1, 17, '2022/07/08', '2022/07/22')
insert into MUON values (1061, 2, 19, '2022/07/08', '2022/07/22')
insert into MUON values (1061, 3, 21, '2022/07/08', '2022/07/22')
insert into MUON values (1062, 1, 23, '2022/07/08', '2022/07/22')
insert into MUON values (1062, 2, 19, '2022/07/08', '2022/07/22')
insert into MUON values (1062, 3, 21, '2022/07/08', '2022/07/22')
insert into MUON values (1063, 1, 23, '2022/07/08', '2022/07/22')
insert into MUON values (1063, 2, 21, '2022/07/08', '2022/07/22')
insert into MUON values (1063, 3, 23, '2022/07/08', '2022/07/22')

insert into DANG_KY values (1061, 24, '2022/07/11', N'Thằng nào mượn trả lẹ cho bố!')
insert into DANG_KY values (1061, 25, '2022/07/11', N'Thằng nào mượn trả lẹ cho bố!')
insert into DANG_KY values (1061, 26, '2022/07/11', N'Thằng nào mượn trả lẹ cho bố!')
insert into DANG_KY values (1062, 27, '2022/07/11', N'Thằng nào mượn trả lẹ cho bố!')
insert into DANG_KY values (1062, 24, '2022/07/11', N'Thằng nào mượn trả lẹ cho bố!')
insert into DANG_KY values (1062, 25, '2022/07/11', N'Thằng nào mượn trả lẹ cho bố!')
insert into DANG_KY values (1063, 26, '2022/07/11', N'Thằng nào mượn trả lẹ cho bố!')
insert into DANG_KY values (1063, 27, '2022/07/11', N'Thằng nào mượn trả lẹ cho bố!')
insert into DANG_KY values (1063, 25, '2022/07/11', N'Thằng nào mượn trả lẹ cho bố!')

insert into QUA_TRINH_MUON values (1071, 1, '2022/04/11', 28, '2022/04/25', '2022/04/18', NULL, NULL, NULL, NULL)
insert into QUA_TRINH_MUON values (1071, 2, '2022/04/11', 29, '2022/04/25', '2022/04/18', NULL, NULL, NULL, NULL)
insert into QUA_TRINH_MUON values (1071, 3, '2022/04/11', 30, '2022/04/25', '2022/04/18', NULL, NULL, NULL, NULL)
insert into QUA_TRINH_MUON values (1072, 1, '2022/04/11', 31, '2022/04/25', '2022/04/18', NULL, NULL, NULL, NULL)
insert into QUA_TRINH_MUON values (1072, 2, '2022/04/11', 28, '2022/04/25', '2022/04/18', NULL, NULL, NULL, NULL)
insert into QUA_TRINH_MUON values (1072, 3, '2022/04/11', 29, '2022/04/25', '2022/04/18', NULL, NULL, NULL, NULL)
insert into QUA_TRINH_MUON values (1073, 1, '2022/04/11', 30, '2022/04/25', '2022/04/18', NULL, NULL, NULL, NULL)
insert into QUA_TRINH_MUON values (1073, 2, '2022/04/11', 31, '2022/04/25', '2022/04/18', NULL, NULL, NULL, NULL)
insert into QUA_TRINH_MUON values (1073, 3, '2022/04/11', 28, '2022/04/25', '2022/04/18', NULL, NULL, NULL, NULL)
insert into QUA_TRINH_MUON values (1081, 1, '2022/04/11', 29, '2022/04/25', '2022/04/30', 24000, 24000, NULL, NULL)
insert into QUA_TRINH_MUON values (1081, 2, '2022/04/11', 30, '2022/04/25', '2022/04/30', 24000, 24000, NULL, NULL)
insert into QUA_TRINH_MUON values (1081, 3, '2022/04/11', 31, '2022/04/25', '2022/04/30', 24000, 24000, NULL, NULL)
insert into QUA_TRINH_MUON values (1082, 1, '2022/04/11', 28, '2022/04/25', '2022/04/30', 24000, 12000, NULL, N'Tiền nợ bố đéo trả')
insert into QUA_TRINH_MUON values (1082, 2, '2022/04/11', 29, '2022/04/25', '2022/04/30', 24000, 12000, NULL, N'Tiền nợ bố đéo trả')
insert into QUA_TRINH_MUON values (1082, 3, '2022/04/11', 30, '2022/04/25', '2022/04/30', 24000, 12000, NULL, N'Tiền nợ bố đéo trả')
insert into QUA_TRINH_MUON values (1083, 1, '2022/04/11', 31, '2022/04/25', '2022/04/30', 24000, 12000, NULL, N'Tiền nợ bố đéo trả')
insert into QUA_TRINH_MUON values (1083, 2, '2022/04/11', 28, '2022/04/25', '2022/04/30', 24000, 12000, NULL, N'Tiền nợ bố đéo trả')
insert into QUA_TRINH_MUON values (1083, 3, '2022/04/11', 29, '2022/04/25', '2022/04/30', 24000, 12000, NULL, N'Tiền nợ bố đéo trả')

