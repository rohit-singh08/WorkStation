CREATE DATABASE 5thFeb --Showing Error why?

CREATE DATABASE ROHIT --Working


CREATE TABLE EmployeeDetails
(
EmployeeID INT,
FirstName VARCHAR(50),
LastName VARCHAR(50),
DepartmentID INT,
ClientID INT,
DOB DATE,
DOJ DATE
)

INSERT INTO EmployeeDetails SELECT 1,'Dilip','Kumar',1,1,'1998-01-01','2022-01-28'
INSERT INTO EmployeeDetails SELECT 2,'Vaishnavi','Arya',1,1,'1998-01-01','2022-01-28'
INSERT INTO EmployeeDetails SELECT 3,'Saransh   ','Aggarwal',1,1,'1998-01-01','2022-01-28'
INSERT INTO EmployeeDetails SELECT 4,'Sen     ','Gupta',1,1,'1998-01-01','2022-01-28'
INSERT INTO EmployeeDetails SELECT 5,'Rohit     ','Singh',2,2,'1998-01-01','2022-01-28'
INSERT INTO EmployeeDetails SELECT 6,'Pooja     ','Ray',2,2,'1998-01-01','2022-01-28'
INSERT INTO EmployeeDetails SELECT 7,'Priyanka  ','Chauhan',2,2,'1998-01-01','2022-01-28'

UPDATE EmployeeDetails SET FirstName=TRIM(FirstName)


CREATE TABLE Department
(
DepartmentID INT,
DepartmentName VARCHAR(100)
)

INSERT INTO Department(DepartmentID,DepartmentName)
SELECT 1,'Software'

INSERT INTO Department(DepartmentID,DepartmentName)
SELECT 2,'IT'

INSERT INTO Department(DepartmentID,DepartmentName)
SELECT 3,'Electronics'

INSERT INTO Department(DepartmentID,DepartmentName)
SELECT 4,'Accounts'

INSERT INTO Department(DepartmentID,DepartmentName)
SELECT 5,'Admin'

UPDATE EmployeeDetails SET DepartmentID = NULL WHERE FirstName ='Priyanka'
UPDATE EmployeeDetails SET DepartmentID = 2 WHERE FirstName IN ('Saransh', 'SEN') 
UPDATE EmployeeDetails SET DepartmentID = 3 WHERE FirstName IN ('Rohit', 'pooja') 

SELECT * FROM EmployeeDetails
SELECT * FROM Department
SELECT * FROM EmployeeDetails CROSS JOIN Department

ALTER TABLE EmployeeDetails ADD Salary INTEGER

UPDATE EmployeeDetails SET Salary = 14000 WHERE FirstName ='Dilip'
UPDATE EmployeeDetails SET Salary = 12000 WHERE FirstName ='Vaishnavi'
UPDATE EmployeeDetails SET Salary = 10000 WHERE FirstName ='Saransh'
UPDATE EmployeeDetails SET Salary = 13000 WHERE FirstName ='Sen'
UPDATE EmployeeDetails SET Salary = 15000 WHERE FirstName ='Rohit'
UPDATE EmployeeDetails SET Salary = 12500 WHERE FirstName ='Pooja'
UPDATE EmployeeDetails SET Salary = 13500 WHERE FirstName ='Priyanka'


DELETE FROM EmployeeDetails WHERE Salary = 12000

SELECT 
EmployeeID,
FirstName,
LastName,
DepartmentName
FROM 
EmployeeDetails  AS ED --LEFT TABLE
RIGHT JOIN Department AS D --RIGHT TABLE
ON ED.DepartmentID=D.DepartmentID


SELECT
*
FROM
EmployeeDetails AS ED
JOIN Department AS D on ED.DepartmentID = D.DepartmentID
WHERE D.DepartmentName = 'IT'

DELETE ED
FROM
EmployeeDetails AS ED
JOIN Department AS D on ED.DepartmentID = D.DepartmentID
WHERE D.DepartmentName = 'IT'

DROP TABLE EmployeeDetails


---------------------Order--------------------------------

SELECT * FROM EmployeeDetails ORDER BY Salary DESC
SELECT * FROM EmployeeDetails ORDER BY Salary ASC

SELECT TOP 2* FROM EmployeeDetails ORDER BY Salary DESC
SELECT TOP 2* FROM EmployeeDetails ORDER BY Salary ASC

Select -----For Showing second highest Salary----
Top 1
*
FROM
(
SELECT TOP 2* FROM EmployeeDetails ORDER BY Salary DESC
) AS W ORDER BY Salary ASC

------------Union---------------

SELECT * FROM EmployeeDetails where DepartmentID = 1
SELECT * FROM EmployeeDetails where DepartmentID = 2

SELECT * FROM EmployeeDetails where DepartmentID = 1
UNION
SELECT * FROM EmployeeDetails where DepartmentID = 2


--------------Except-------------
9:40pm

SELECT DepartmentID FROM Department
EXCEPT
SELECT DepartmentID FROM EmployeeDetails

----------Intersect----
9:48pm
SELECT DepartmentID FROM Department
Intersect
SELECT DepartmentID FROM EmployeeDetails

---------Table Types------

CREATE TABLE #Student
(
StudentID INT,
FirstName Varchar(50),
LastName Varchar(50)
)
SELECT @@SPID

Select *FROM #Student

INSERT INTO #Student(StudentID, FirstName, LastName)
SELECT 1,'Software', 'Wala'

----------------Funtion------------
10:10PM

SELECT *FROM EmployeeDetails
SELECT *FROM Department
SELECT SUM(SALARY) FROM EmployeeDetails
SELECT DepartmentID, SUM(SALARY) FROM EmployeeDetails --When combing the result DepartmentID has no value, therefore the error.

SELECT DepartmentID, SUM(SALARY) FROM EmployeeDetails GROUP BY DepartmentID --Why NULL is at the top?--

SELECT FirstName, SUM(SALARY) FROM EmployeeDetails GROUP BY FirstName

SELECT ClientID, SUM(SALARY) FROM EmployeeDetails GROUP BY ClientID

SELECT COUNT(*) FROM EmployeeDetails
SELECT MAX(SALARY) FROM EmployeeDetails
SELECT MIN(SALARY) FROM EmployeeDetails
SELECT AVG(SALARY) FROM EmployeeDetails

--Answers---
SELECT DepartmentID, Max(SALARY) FROM EmployeeDetails GROUP BY DepartmentID
SELECT ClientID, Avg(SALARY) FROM EmployeeDetails GROUP BY ClientID
SELECT DepartmentID, Min(SALARY) FROM EmployeeDetails GROUP BY DepartmentID
SELECT DepartmentID, Count(DepartmentID) FROM EmployeeDetails GROUP BY DepartmentID

SELECT 
DepartmentName,
MAX(Salary)
FROM
EmployeeDetails AS ED
INNER JOIN Department AS D ON ED.DepartmentID=D.DepartmentID 
GROUP BY DepartmentName

SELECT 
FirstName,
AVG(Salary)
FROM
EmployeeDetails AS ED
INNER JOIN Department AS D ON ED.DepartmentID=D.DepartmentID 
GROUP BY FirstName

SELECT 
DepartmentName,
MIN(Salary)
FROM
EmployeeDetails AS ED
INNER JOIN Department AS D ON ED.DepartmentID=D.DepartmentID 
GROUP BY DepartmentName

SELECT 
DepartmentName,
Count(DepartmentName)
FROM
EmployeeDetails AS ED
INNER JOIN Department AS D ON ED.DepartmentID=D.DepartmentID 
GROUP BY DepartmentName









