CREATE DATABASE EmployeeDB
GO

USE EmployeeDB
GO

CREATE TABLE Department
(
	DepartID INT PRIMARY KEY,
	DepartName VARCHAR(50) NOT NULL,
	Description VARCHAR(100) NOT NULL
)
GO

CREATE TABLE Employee 
(
	EmpCode CHAR(6) PRIMARY KEY,
	FirstName VARCHAR(30) NOT NULL,
	LastName VARCHAR(30) NOT NULL,
	Birthday SMALLDATETIME NOT NULL,
	Gender BIT DEFAULT 1,
	Address VARCHAR(100),
	DepartID INT FOREIGN KEY (DepartID) REFERENCES Department(DepartID),
	Salary MONEY,

	CONSTRAINT FK FOREIGN KEY (DepartID) REFERENCES Department(DepartID)
)
GO

--3
INSERT Department VALUES (101,'Financial','Financial management')
INSERT Department VALUES (102,'Personnel','Personnel management')
INSERT Department VALUES (103,'Project','Project management')

INSERT Employee VALUES (1,'James','Smith','1994-04-17','1','New York', 101,2200)
INSERT Employee VALUES (2,'Maria','Garcia','1996-10-12','0','San Francisco', 101,2500)
INSERT Employee VALUES (3,'James','Johnson','1995-09-22','1','Georgia', 102,2800)
INSERT Employee VALUES (4,'David','Degea','1991-05-01','1','California', 103,3400)
INSERT Employee VALUES (5,'Lee','Hartman','1996-04-28','1','Virginia', 103,3000)
GO

--4
UPDATE Employee
SET Salary = Salary * 1.1
GO

--5
ALTER TABLE Employee
ADD CONSTAINT CheckSalary CHECK (Salary > 0)