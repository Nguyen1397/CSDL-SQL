CREATE DATABASE CitySoftware
GO

USE CitySoftware
GO

DROP DATABASE CitySoftware
GO
CREATE TABLE Employee
(
	EmployeeID INT PRIMARY KEY,
	Name NVARCHAR(100),
	Tel CHAR(11),
	Email VARCHAR(30)
)
GO

CREATE TABLE Project
(
	ProjectID INT PRIMARY KEY,
	ProjectName NVARCHAR(30),
	StartDate DATETIME,
	EndDate DATETIME,
	Period INT,
	Cost MONEY
)
GO

CREATE TABLE Groups
(
	GroupID INT PRIMARY KEY,
	GroupName NVARCHAR(30),
	LeaderID INT FOREIGN KEY REFERENCES Employee(EmployeeID),
	ProjectID INT FOREIGN KEY REFERENCES Project(ProjectID)
)
GO

CREATE TABLE GroupDetail
(
	GroupID INT FOREIGN KEY REFERENCES Groups(GroupID),
	EmployeeID INT FOREIGN KEY REFERENCES Employee(EmployeeID),
	Status NCHAR(20)
)
GO

--2
INSERT Employee VALUES (01,N'Nguyễn Khôi Nguyên','0987654321','nkn@gmail.com')
INSERT Employee VALUES (02,N'Đặng Đình Chiểu','0987654322','ddc@gmail.com')
INSERT Employee VALUES (03,N'Phạm Văn Tuấn Anh','0987654323','pvta@gmail.com')
GO
INSERT Project VALUES (1001,N'Chính phủ điện tử','20220813','20230207',6,6000)
INSERT Project VALUES (1002,N'Núp lùm','20230311','20230726',4,3000)
GO
INSERT Groups VALUES (1,N'Nhóm 1',01,1001)
INSERT Groups VALUES (2,N'Nhóm 2',02,1002)
GO
INSERT GroupDetail VALUES (1,01,N'1-Nhóm 1')
INSERT GroupDetail VALUES (1,02,N'2-Nhóm 1')
INSERT GroupDetail VALUES (2,02,N'1-Nhóm 2')
INSERT GroupDetail VALUES (2,03,N'2-Nhóm 2')
GO

--3
----a
SELECT * FROM Employee
GO
----b
SELECT E.Name FROM Employee AS E
JOIN GroupDetail AS GD ON E.EmployeeID = GD.EmployeeID
JOIN Groups AS G ON GD.GroupID = G.GroupID
JOIN Project AS P ON G.ProjectID = P.ProjectID
WHERE P.ProjectName = N'Chính phủ điện tử'
----c
SELECT COUNT(*) AS N'SL nv mỗi nhóm' FROM Groups AS G
JOIN GroupDetail AS GD ON G.GroupID = GD.GroupID
JOIN Employee AS E ON GD.EmployeeID = E.EmployeeID
GROUP BY G.GroupID

SELECT * FROM Employee
SELECT * FROM Groups
SELECT * FROM Project
SELECT * FROM GroupDetail