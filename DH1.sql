﻿CREATE DATABASE HoaDon
GO

USE HoaDon
GO

CREATE TABLE Kho
(
	ID_SP VARCHAR(5) PRIMARY KEY,
	TenSP NVARCHAR(40),
	MoTa NVARCHAR(40),
	DonVi NVARCHAR(20),
	Gia MONEY,
	TonKho VARCHAR(5),
)
GO
INSERT Kho VALUES (1,N'Máy tính T450',N'Máy nhập mới',N'Chiếc',1000,50)
INSERT Kho VALUES (2,N'Điện thoại Nokia5670',N'Điện thoại đang hot',N'Chiếc',200,130)
INSERT Kho VALUES (3,N'Máy Tính T450',N'Máy nhập mới',N'Chiếc',100,23)
GO

CREATE TABLE KhachHang
(
	TenKH NVARCHAR(20) PRIMARY KEY,
	DiaChi NVARCHAR(40),
	SDT VARCHAR(12),
)
GO
INSERT KhachHang VALUES (N'Nguyễn Văn An',N'111 Nguyễn Trãi, Thanh Xuân, Hà Nội',987654321)
GO

CREATE TABLE DonHang
(
	MaDH VARCHAR(5) PRIMARY KEY,
	TenKH NVARCHAR(20) FOREIGN KEY REFERENCES KhachHang(TenKH),
	NgayDH DATE
)
GO
INSERT DonHang VALUES (123,N'Nguyễn Văn An','20091118')
GO

CREATE TABLE ChiTietDH
(
	MaDH VARCHAR(5) FOREIGN KEY REFERENCES DonHang(MaDH),
	MaSP VARCHAR(5) FOREIGN KEY REFERENCES Kho(ID_SP),
	TenSP NVARCHAR(40),
	Gia MONEY,
	SL INT
)
GO
INSERT ChiTietDH VALUES (123,1,N'Máy tính T450',1000,1)
INSERT ChiTietDH VALUES (123,2,N'Điện thoại Nokia5670',200,2)
INSERT ChiTietDH VALUES (123,3,N'Máy Tính T450',100,1)
GO

--2
SELECT DH.MaDH, KH.*, DH.NgayDH 
FROM DonHang AS DH, KhachHang AS KH

SELECT K.TenSP, K.MoTa, K.DonVi, K.Gia, CT.SL, K.Gia * CT.SL AS ThanhTien
FROM Kho AS K, ChiTietDH AS CT 
WHERE K.TenSP = CT.TenSP AND K.ID_SP = CT.MaSP
--4


DROP TABLE Kho
DROP TABLE KhachHang
DROP TABLE DonHang
DROP TABLE ChiTietDH