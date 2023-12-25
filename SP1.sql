CREATE DATABASE SP2
GO

USE SP2
GO

CREATE TABLE Firm
(
	F_ID VARCHAR(5) PRIMARY KEY,
	F_Name VARCHAR(20),
	Address VARCHAR(20),
	Tel VARCHAR(12)
)
GO
INSERT Firm VALUES (123,'Asus','USA',983232)
INSERT Firm VALUES (124,'Samsung','Korea',458271)
INSERT Firm VALUES (125,'Dell','USA',847358)
INSERT Firm VALUES (126,'Nokia','USA',848362)
GO

CREATE TABLE Product
(
	F_ID VARCHAR(5) FOREIGN KEY REFERENCES Firm(F_ID),
	Name NVARCHAR(50) PRIMARY KEY,
	Des NVARCHAR(30),
	Unit NVARCHAR(10),
	Price Money,
	Amt INT
)
GO
INSERT Product VALUES (123,N'Máy tính T450', N'Máy nhập cũ', N'Chiếc', 1000, 10)
INSERT Product VALUES (126,N'Điện thoại Nokia5670', N'Điện thoại đang hot', N'Chiếc', 200, 200)
INSERT Product VALUES (124,N'Máy in Samsung 450', N'Máy in loại bình', N'Chiếc', 100, 10)
INSERT Product VALUES (123,N'Máy tính T470', N'Máy nhập mới', N'Chiếc', 1200, 15)
INSERT Product VALUES (125,N'Máy tính Optiplex 9020', N'Máy nhập mới', N'Chiếc', 1500, 20)
INSERT Product VALUES (124,N'Điện thoại Samsung NOTE7', N'Điện thoại hot', N'Chiếc', 600, 50)
GO


--2
SELECT * FROM Product
SELECT * FROM Firm

--4
----A
	SELECT F_Name FROM Firm
----B
	SELECT Name FROM Product

--5
----A
SELECT * FROM Firm
ORDER BY F_Name DESC
----B
SELECT * FROM Product
ORDER BY Price DESC
----C
SELECT * FROM Firm
WHERE F_Name = 'Asus'
----D
SELECT * FROM Product
WHERE Amt < 11
----E
SELECT * FROM Product
WHERE F_ID = 123

--6
----A
SELECT COUNT(*) FROM Firm
----B
SELECT COUNT(*) FROM Product
----C
SELECT F.F_Name, COUNT(*) FROM Firm AS F, Product AS P
ORDER BY F.F_ID
----D
SELECT COUNT(Amt) FROM Product


DROP TABLE Product
DROP TABLE Firm