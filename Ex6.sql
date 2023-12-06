USE AdventureWorks2022
GO

--Lấy ra dữ liệu của bảng Contact có ContactID >= 100 và <= 200
SELECT * FROM Person.Person
WHERE BusinessEntityID >= 100 AND BusinessEntityID <= 200

--Lấy ra dữ liệu của bảng Contact có ContactID trong khoảng [100, 200]
SELECT * FROM Person.Person
WHERE BusinessEntityID BETWEEN 100 AND  200

SELECT * FROM Person.Person
WHERE BusinessEntityID BETWEEN 10 AND  20

--Lấy ra dữ liệu của bảng Contact có ContactID trong tập hợp (100, 107, 200, 2210)
SELECT * FROM Person.Person
WHERE BusinessEntityID IN (100, 107, 200, 2210)

SELECT * FROM Person.Person
WHERE MiddleName in ('B','M','T')

--Lấy ra dữ liệu của bảng Contact có LastName kết thúc bởi ký tự e (WILDCARD LIKE SPL Microsoft)
SELECT * FROM Person.Person
WHERE LastName LIKE '%e'

--Lấy ra dữ liệu của bảng Contact có LastName bắt đầu bởi ký tự R hoặc A kết thúc bởi kí tự e
SELECT * FROM Person.Person
WHERE LastName LIKE '[RA]%e'

--Lấy ra dữ liệu của bảng Contact có LastName có 4 ký tự bắt đầu bởi kí tự R hoặc A kết thúc bởi kí tự e
SELECT * FROM Person.Person
WHERE LastName LIKE '[RA]__%e'

--Sử dụng DISTINCT các dữ liệu trùng lặp bị loại bỏ
SELECT DISTINCT Title FROM Person.Person

--Sử dụng GROUP BY các dữ liệu trùng lặp được gộp thành nhóm
-- aggregate function : sum, max, min, count, avg ..
SELECT Count(BusinessEntityID) as TotalID, Title
FROM Person.Person
GROUP BY Title

--do đó ta có thể sử dụng được với các hàm tập hợp
SELECT Title, COUNT(*) [Title Number]
FROM Person.Person
GROUP BY Title

SELECT * FROM Sales.SalesPerson
SELECT * FROM Person.Person

SELECT * FROM Person.Person
WHERE BusinessEntityID IN (1,4,99)

SELECT * FROM Person.Person
WHERE BusinessEntityID IN (SELECT BusinessEntityID FROM Sales.SalesPerson)


SELECT * FROM Person.Person INNER JOIN Sales.SalesPerson
ON Person.BusinessEntityID = SalesPerson.BusinessEntityID

SELECT * FROM Person.Person LEFT OUTER JOIN Sales.SalesPerson
ON Person.BusinessEntityID = SalesPerson.BusinessEntityID

SELECT * FROM Person.Person RIGHT OUTER JOIN Sales.SalesPerson
ON Person.BusinessEntityID = SalesPerson.BusinessEntityID
--Ta có thể sd mệnh đề WHERE để thỏa mãn điều kiện tìm kiếm
SELECT Title, COUNT(*)
FROM Person.Person
GROUP BY Title

SELECT COUNT(BusinessEntityID) AS CountBUS, Title
FROM Person.Person
WHERE EmailPromotion IN (1,2)
GROUP BY Title
HAVING COUNT(BusinessEntityID) > 100

SELECT * FROM Person.Person

--GROUP BY với ALL sẽ lấy ra các hàng bị loại bỏ bởi mệnh đề WHERE
--( Vì mệnh đề WHERE sẽ lọc kết quả sau khi đã gộp nhóm)
SELECT Title, COUNT(*) [Title Number]
FROM Person.Person
WHERE Title LIKE 'Mr%'
GROUP BY Title

SELECT * FROM Person.Person

--GROUP BY với HAVING: mệnh đề HAVING sẽ lọc kq trong lúc đc gộp nhóm
SELECT Title, COUNT(*) [Title Number]
FROM Person.Person
GROUP BY ALL Title
HAVING Title LIKE 'Mr%'

SELECT Title, COUNT(*) [Title Number]
FROM Person.Person
--WHERE COUNT(*) > 10
GROUP BY ALL Title
HAVING Title LIKE 'Mr%' OR COUNT(*) > 10

--GROUP BY với CUBE: Sẽ có thêm một hàng siêu kết hợp gộp tất cả các hàng trong tập trả về
SELECT Title, COUNT(*) [Title Number]
FROM Person.Person
GROUP BY Title WITH CUBE

--GROUP BY với CUBE: Sẽ có thêm một hàng siêu kết hợp gộp tất cả các hàng trong tập trả về
SELECT Title, COUNT(*) [Title Number]
FROM Person.Person
GROUP BY Title WITH ROLLUP

--ORDER BY dùng để sắp xếp kết quả trả về
SELECT *  FROM Person.Person
ORDER BY FirstName, LastName DESC

/*
	Truy vấn từ nhiều bảng
	Lấy toàn bộ Contact của nhân viên (HumanResources.Employee)
*/
--Truy vấn con
SELECT * FROM Person.Person
WHERE BusinessEntityID IN (
	SELECT BusinessEntityID
	FROM HumanResources.Employee)
SELECT * FROM HumanResources.Employee
--SupQuery MSDN (Docs microsoft sql)
--Truy vấn quan hệ sd EXIST
SELECT * FROM Person.Person P
WHERE EXISTS (
		SELECT BusinessEntityID
		FROM HumanResources.Employee
		WHERE BusinessEntityID=P.BusinessEntityID)

--Kết hợp dữ liệu sd UNION
SELECT BusinessEntityID, FirstName
FROM Person.Person
WHERE BusinessEntityID IN (1,2,3,4,5,6)
UNION
SELECT BusinessEntityID, FirstName
FROM Person.Person
WHERE BusinessEntityID IN (1,3,5,7) AND FirstName LIKE '%A%'

--UNION với ALL không loại bỏ giá trị trùng lặp
SELECT BusinessEntityID, FirstName
FROM Person.Person
WHERE BusinessEntityID IN (1,2,3,4,5,6)
UNION ALL
SELECT BusinessEntityID
FROM Person.Person
WHERE BusinessEntityID IN (1,3,5,7)

--Sử dụng INNER JOIN
SELECT Person.Person.*, E.*
FROM Person.Person P INNER JOIN HumanResources.Employee E ON
	P.BusinessEntityID=e.BusinessEntityID

SELECT * FROM Person.Person
SELECT * FROM Person.PersonPhone
SELECT Per.BusinessEntityID, Person.FirstName, Person.PersonPhone
 FROM Person.Person Per
INNER JOIN Person.PersonPhone Phone ON
 Per.BusinessEntityID = Phone.BusinessEntityID

 --SELECT * FROM
 SELECT Per.BusinessEntityID, Person.FirstName, Person.PersonPhone
 FROM Person.Person Per
LEFT OUTER JOIN Person.PersonPhone Phone ON
 Per.BusinessEntityID = Phone.BusinessEntityID

 SELECT Per.BusinessEntityID, Person.FirstName, Person.PersonPhone
 FROM Person.Person Per
RIGHT OUTER JOIN Person.PersonPhone Phone ON
 Per.BusinessEntityID = Phone.BusinessEntityID

 --Sử dụng OUTER JOIN
 SELECT Person.Person.*
 FROM Person.Person LEFT OUTER JOIN HumanResources.Employee ON
	Person.Person.BusinessEntityID=HumanResources.Employee.BusinessEntityID

--Làm rõ kết quả trả về với A5
SELECT C.*
FROM Person.Person AS C LEFT OUTER JOIN HumanResources.Employee AS E ON 
	C.BusinessEntityID= E.BusinessEntityID