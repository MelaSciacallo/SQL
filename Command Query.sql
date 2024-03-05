 --CREATE 
 
 --CREATE  TABLE EmployeeDemographics
--(EmployeeID int,
--FirstName varchar(50),
--LastName varchar(50),
--Age int,
--Gender varchar(50)
--)

--CREATE TABLE EmployeeSalary
--(EmployeeID int,
--JobTitle varchar(50),
--Salary int
--)


--CREATE TABLE WareHouseEmployeeDemographics
--(EmployeeID int,
--FirstName varchar(50),
--LastName varchar (50),
--Age int,
--Gender varchar (50)
--)
--INSERT

--INSERT INTO EmployeeDemographics VALUES
--(1001, 'Jim', 'Halpert', 30, 'Male'),
--(1002, 'Pam', 'Beasley', 30, 'Female'),
--(1003, 'Dwight', 'Schrute', 29, 'Male'),
--(1004, 'Angela', 'Martin', 31, 'Female'),
--(1005, 'Toby', 'Flenderson', 32, 'Male'),
--(1006, 'Michael', 'Scott', 35, 'Male'),
--(1007, 'Meredith', 'Palmer', 32, 'Female'),
--(1008, 'Stanley', 'Hudson', 38, 'Male'),
--(1009, 'Kevin', 'Malone', 31, 'Male')

--INSERT INTO EmployeeSalary VALUES
--(1001, 'Salesman', 45000),
--(1002,'Receptionist', 36000),
--(1003, 'Salesman', 63000),
--(1004, 'Accountant', 47000),
--(1005, 'HR', 50000),
--(1006, 'Regional Manager', 65000),
--(1007, 'Supplier Relations', 41000),
--(1008, 'Salesman', 48000),
--(1009, 'Accountant', 42000)

--INSERT INTO WareHouseEmployeeDemographics VALUES
--(1013, 'Daryll', 'Philbin', NULL, 'Male'),
--(1050, 'Roy', 'Anderson', 31, 'Male'),
--(1051, 'Hidetoshi', 'Hasagawa', 40, 'Male'),
--(1052, 'Val', 'Johnson', 31,'Female')

--SELECT Statement 

--Select *
--FROM EmployeeDemographics

--SELECT EmployeeID
--FROM EmployeeDemographics

--SELECT DISTINCT EmployeeID
--FROM EmployeeDemographics

--SELECT COUNT (LastName)
--FROM EmployeeDemographics


--SELECT COUNT (LastName) As LastNameCount
--FROM EmployeeDemographics

--SELECT *
--FROM EmployeeSalary

--SELECT MAX(Salary)
--FROM EmployeeSalary

--SELECT MIN(Salary)
--FROM EmployeeSalary

--SELECT AVG(Salary)
--FROM EmployeeSalary

--SELECT *
--FROM SQLTutorial.dbo.EmployeeSalary

--WHERE Statement

--Select *
--FROM EmployeeDemographics
--Where FirstName = 'Jim'

--Select *
--FROM EmployeeDemographics
--Where FirstName <> 'Jim'

--Select *
--FROM EmployeeDemographics
--Where Age > 30

--Select *
--FROM EmployeeDemographics
--Where Age >= 30

--Select *
--FROM EmployeeDemographics
--Where Age < 32

--Select *
--FROM EmployeeDemographics
--Where Age <= 32

--Select *
--FROM EmployeeDemographics
--Where Age <= 32 And Gender = 'Male'

--Select *
--FROM EmployeeDemographics
--Where Age <= 32 Or Gender = 'Male'

--Select *
--FROM EmployeeDemographics
--Where LastName LIKE 's%'

--Select *
--FROM EmployeeDemographics
--Where LastName LIKE '%n'

--Select *
--FROM EmployeeDemographics
--Where LastName LIKE '%s%'

--Select *
--FROM EmployeeDemographics
--Where LastName LIKE 's%o%'

--Select *
--FROM EmployeeDemographics
--Where FirstName is NULL


--Select *
--FROM EmployeeDemographics
--Where FirstName is NOT NULL


--Select *
--FROM EmployeeDemographics
--Where FirstName IN ('Jim', 'Toby', 'Kevin')


--GROUP BY , ORDER BY

--Select Gender, COUNT (Gender) AS Number
--FROM EmployeeDemographics
--GROUP BY Gender

--Select Gender, Age, COUNT (Gender) AS Number
--FROM EmployeeDemographics
--GROUP BY Gender, Age

--Select Gender,  COUNT (Gender) AS Number
--FROM EmployeeDemographics
--WHERE Age > 31
--GROUP BY Gender

--Select Gender,  COUNT (Gender) AS CountGender
--FROM EmployeeDemographics
--WHERE Age > 31
--GROUP BY Gender
--ORDER BY CountGender

--Select Gender,  COUNT (Gender) AS CountGender
--FROM EmployeeDemographics
--WHERE Age > 31
--GROUP BY Gender
--ORDER BY CountGender DESC

--Select *
--FROM EmployeeDemographics
--ORDER BY Age

--Select *
--FROM EmployeeDemographics
--ORDER BY Age DESC

--Select *
--FROM EmployeeDemographics
--ORDER BY Age , Gender


--Select *
--FROM EmployeeDemographics
--ORDER BY 4 DESC, 5 DESC

/*
Inner Joins, Full/Left/ Outer Joins
*/

--INSERT INTO EmployeeDemographics VALUES
--(1011, 'Ryan', 'Howard', 26, 'Male'),
--(NULL, 'Holly', 'Flax', NULL, 'NULL'),
--(1013, 'Daryll', 'Philbin', NULL, 'Male')

--INSERT INTO EmployeeSalary VALUES
--(1010, 'NULL', 47000),
--(NULL, 'Salesman', 43000)


--SELECT * 
--FROM SQLTutorial.dbo.EmployeeDemographics


--SELECT * 
--FROM SQLTutorial.dbo.EmployeeSalary

--SELECT *
--FROM SQLTutorial.dbo.EmployeeDemographics
--INNER JOIN SQLTutorial.dbo.EmployeeSalary
--	ON EmployeeDemographics.EmployeeID = EmployeeSalary.EmployeeID

--SELECT *
--FROM SQLTutorial.dbo.EmployeeDemographics
--FULL OUTER JOIN SQLTutorial.dbo.EmployeeSalary
--	ON EmployeeDemographics.EmployeeID = EmployeeSalary.EmployeeID

--SELECT *
--FROM SQLTutorial.dbo.EmployeeDemographics
--LEFT OUTER JOIN SQLTutorial.dbo.EmployeeSalary
--	ON EmployeeDemographics.EmployeeID = EmployeeSalary.EmployeeID

--SELECT *
--FROM SQLTutorial.dbo.EmployeeDemographics
--RIGHT OUTER JOIN SQLTutorial.dbo.EmployeeSalary
--	ON EmployeeDemographics.EmployeeID = EmployeeSalary.EmployeeID

--SELECT EmployeeDemographics.EmployeeID, FirstName, LastName, JobTitle, Salary
--FROM SQLTutorial.dbo.EmployeeDemographics
--INNER JOIN SQLTutorial.dbo.EmployeeSalary
--	ON EmployeeDemographics.EmployeeID = EmployeeSalary.EmployeeID

--SELECT EmployeeDemographics.EmployeeID, FirstName, LastName, JobTitle, Salary
--FROM SQLTutorial.dbo.EmployeeDemographics
--LEFT OUTER JOIN SQLTutorial.dbo.EmployeeSalary
--	ON EmployeeDemographics.EmployeeID = EmployeeSalary.EmployeeID

--SELECT EmployeeDemographics.EmployeeID, FirstName, LastName, JobTitle, Salary
--FROM SQLTutorial.dbo.EmployeeDemographics
--RIGHT OUTER JOIN SQLTutorial.dbo.EmployeeSalary
--	ON EmployeeDemographics.EmployeeID = EmployeeSalary.EmployeeID

--SELECT EmployeeDemographics.EmployeeID, FirstName, LastName, JobTitle, Salary
--FROM SQLTutorial.dbo.EmployeeDemographics
--FULL OUTER JOIN SQLTutorial.dbo.EmployeeSalary
--	ON EmployeeDemographics.EmployeeID = EmployeeSalary.EmployeeID

--SELECT EmployeeDemographics.EmployeeID, FirstName, LastName, Salary
--FROM SQLTutorial.dbo.EmployeeDemographics
--INNER JOIN SQLTutorial.dbo.EmployeeSalary
--	ON EmployeeDemographics.EmployeeID = EmployeeSalary.EmployeeID

--SELECT  EmployeeDemographics.EmployeeID, FirstName, LastName, Salary
--FROM SQLTutorial.dbo.EmployeeDemographics
--INNER JOIN SQLTutorial.dbo.EmployeeSalary
--	ON EmployeeDemographics.EmployeeID = EmployeeSalary.EmployeeID
--WHERE FirstName  <>  'Michael'
--ORDER BY Salary DESC

--SELECT JobTitle, AVG (Salary) AS AvgSalary
--FROM SQLTutorial.dbo.EmployeeDemographics
--INNER JOIN SQLTutorial.dbo.EmployeeSalary
--	ON EmployeeDemographics.EmployeeID = EmployeeSalary.EmployeeID
--WHERE JobTitle = 'Salesman'
--GROUP BY JobTitle 

/*
Uinon, Unino All
*/

--Select*
--From SQLTutorial.dbo.EmployeeDemographics
--Full Outer Join SQLTutorial.dbo.WareHouseEmployeeDemographics
--	ON EmployeeDemographics.EmployeeID=
--	WareHouseEmployeeDemographics.EmployeeID

--Select*
--From SQLTutorial.dbo.EmployeeDemographics

--UNION
--Select*
--From SQLTutorial.dbo.WareHouseEmployeeDemographics


--Select*
--From SQLTutorial.dbo.EmployeeDemographics
--UNION All
--Select*
--From SQLTutorial.dbo.WareHouseEmployeeDemographics



/*
Case Statement
*/

--Select FirstName , Age
--From SQLTutorial.dbo.EmployeeDemographics
--Where Age IS NOT NULL

--Select FirstName , LastName,Age
--From SQLTutorial.dbo.EmployeeDemographics
--Where Age IS NOT NULL
--ORDER BY Age

--Select FirstName , LastName,Age,
--CASE
--	When Age > 30 THEN 'Old'
--	ELSE 'Young'
--END
--From SQLTutorial.dbo.EmployeeDemographics
--Where Age IS NOT NULL
--ORDER BY Age

--Select FirstName, LastName, Age,
--CASE
--	When Age > 31 THEN 'Old'
--	When Age < 30 THEN 'Baby'
--	ELSE 'Young'
--END
--From SQLTutorial.dbo.EmployeeDemographics
--Where Age IS NOT NULL
--ORDER BY Age

--Select FirstName, LastName, Age,
--CASE
--	When Age > 30 THEN 'Old'
--	When Age BEtWEEN  27 AND 30 THEN 'Young'
--	ELSE 'Baby'
--END
--From SQLTutorial.dbo.EmployeeDemographics
--Where Age IS NOT NULL
--ORDER BY Age

--Select FirstName, LastName, JobTitle, Salary
--From SQLTutorial.dbo.EmployeeDemographics
--Join SQLTutorial.dbo.EmployeeSalary
--On EmployeeDemographics.EmployeeID = EmployeeSalary.EmployeeID

--Select FirstName, LastName, JobTitle, Salary,
--CASE
--	WHEN JobTitle = 'Salesman' THEN Salary + (Salary*.10)
--	WHEN JobTitle = 'Accountant' THEN Salary + (Salary*.05)
--	WHEN JobTitle = 'HR' THEN Salary + (Salary*.01)
--	ELSE Salary + (Salary*.03)
--END AS SalaryAfterRaise
--From SQLTutorial.dbo.EmployeeDemographics
--Join SQLTutorial.dbo.EmployeeSalary
--On EmployeeDemographics.EmployeeID = EmployeeSalary.EmployeeID


/*
Having Clause
*/

--Select JobTitle, COUNT(JobTitle)
--FROM SQLTutorial.dbo.EmployeeDemographics
--JOIN SQLTutorial.dbo.EmployeeSalary
--	ON EmployeeDemographics.EmployeeID = EmployeeSalary.EmployeeID
--GROUP BY JobTitle
--HAVING COUNT (JobTitle) > 1

--Select JobTitle, AVG (Salary)
--FROM SQLTutorial.dbo.EmployeeDemographics
--JOIN SQLTutorial.dbo.EmployeeSalary
--	ON EmployeeDemographics.EmployeeID = EmployeeSalary.EmployeeID
--GROUP BY JobTitle
--HAVING AVG (Salary) > 45000
--ORDER BY AVG (Salary)

/*
Updating / Deleting Data
*/

--UPDATE SQLTutorial.dbo.EmployeeDemographics
--SET EmployeeID = 1012
--WHERE FirstName = 'Holly' AND LastName = 'Flax'

--UPDATE SQLTutorial.dbo.EmployeeDemographics
--SET Age = 31, Gender = 'Female'
--WHERE FirstName = 'Holly' AND LastName = 'Flax'

--DELETE FROM SQLTutorial.dbo.EmployeeDemographics
--WHERE EmployeeID = 1005

/*
Aliasing
*/

--Select FirstName AS Fname
--FROM SQLTutorial.dbo.EmployeeDemographics

--Select FirstName + ' ' + LastName As FullName
--FROM SQLTutorial.dbo.EmployeeDemographics

--Select Demo.EmployeeID
--FROM SQLTutorial.dbo.EmployeeDemographics AS Demo

--Select Demo.FirstName, Demo.LastName, Sal.Salary
--FROM SQLTutorial.dbo.EmployeeDemographics AS Demo
--JOIN SQLTutorial.dbo.EmployeeSalary AS Sal
--	ON Demo.EmployeeID = Sal.EmployeeID

/*
Partition By
*/

--Select * 
--FROM SQLTutorial..EmployeeDemographics dem
--JOIN SQLTutorial..EmployeeSalary sal
--	ON dem.EmployeeID = sal.EmployeeID

--Select FirstName, LastName, Gender, Salary,
--COUNT (Gender) OVER (PARTITION BY Gender)  TotalGender
--FROM SQLTutorial..EmployeeDemographics dem
--JOIN SQLTutorial..EmployeeSalary sal
--	ON dem.EmployeeID = sal.EmployeeID

--Select Gender,
--COUNT (Gender)   TotalGender
--FROM SQLTutorial..EmployeeDemographics dem
--JOIN SQLTutorial..EmployeeSalary sal
--	ON dem.EmployeeID = sal.EmployeeID
--GROUP BY Gender

/*
CTEs
*/
--WITH CTE_employee AS
--(SELECT FirstName, LastName, Gender, Salary,
--COUNT (Gender) OVER (PARTITION BY Gender)  TotalGender
--, AVG (Salary) OVER (PARTITION BY Salary) AvgSalary
--FROM SQLTutorial..EmployeeDemographics dem
--JOIN SQLTutorial..EmployeeSalary sal
--	ON dem.EmployeeID = sal.EmployeeID
--WHERE Salary > '45000'
--)

--Select*
--FROM CTE_employee

--WITH CTE_employee AS
--(SELECT FirstName, LastName, Gender, Salary,
--COUNT (Gender) OVER (PARTITION BY Gender)  TotalGender
--, AVG (Salary) OVER (PARTITION BY Salary) AvgSalary
--FROM SQLTutorial..EmployeeDemographics dem
--JOIN SQLTutorial..EmployeeSalary sal
--	ON dem.EmployeeID = sal.EmployeeID
--WHERE Salary > '45000'
--)

--Select FirstName , AvgSalary
--FROM CTE_employee

/*
Temp Tables
*/

--CREATE TABLE #temp_employee
--(EmployeeID int,
--HobTitle varchar (100),
--Salary int
--)
--INSERT INTO #temp_employee VALUES
--(1001, 'HR', 45000
--)

--Select*
--FROM #temp_employee

--INSERT INTO #temp_employee
--Select*
--FROM SQLTutorial..EmployeeDemographics

/*
String Functions - 
TRIM, LTRIM, RTRIM, REPLACE, SUBSTRING, UPPER, LOWER
*/

--Create Table EmployeeErrors (
--EmployeeID varchar(50),
--FirstName varchar(50),
--LastName varchar(


--Insert Into EmployeeErrors Values
--('1001', 'JImbo', 'Halbert'),
--('1002', 'Pamela', 'Beasely'),
--('1005', 'TOby', 'Flenderson - Fired')



--Select*
--From EmployeeErrors
--Update EmployeeErrors
--Set EmployeeID = '1001  '
--Where FirstName= 'Jimbo'

--Select EmployeeID, TRIM (EmployeeID) AS TrimID
--From EmployeeErrors

--Select EmployeeID, LTRIM (EmployeeID) AS TrimID
--From EmployeeErrors

--Select EmployeeID, RTRIM (EmployeeID) AS TrimID
--From EmployeeErrors

--Select LastName, REPLACE (LastName,'- Fired', '') AS LastNameFixed
--FRom EmployeeErrors


--Select SUBSTRING (FirstName,1,3)
--From EmployeeErrors

--Select SUBSTRING (err.FirstName,1,3),SUBSTRING(dem.FirstName,1,3)
--From EmployeeErrors as err
--JOIn EmployeeDemographics as dem
--	ON SUBSTRING (err.FirstName,1,3) = SUBSTRING(dem.FirstName,1,3)


--Select err.FirstName, SUBSTRING (err.FirstName,1,3),dem.firstName,SUBSTRING(dem.FirstName,1,3)
--From EmployeeErrors as err
--JOIn EmployeeDemographics as dem
--	ON SUBSTRING (err.FirstName,1,3) = SUBSTRING(dem.FirstName,1,3)

--Select FirstName , UPPER(FirstName)
--From EmployeeErrors


--Select FirstName , LOWER (FirstName)
--From EmployeeErrors

/*
Stored Procedures
*/

--CREATE PROCEDURE TEST
--AS
--Select *
--From EmployeeDemographics

--EXEC TEST

/*
Subquiries ( in the select , From , and Where statement )
*/
--Select*
--From EmployeeSalary

--Select EmployeeID, Salary, (Select AVG(Salary) From EmployeeSalary) AvgSalary
--From EmployeeSalary

--Select *,(Select AVG(Salary) From EmployeeSalary) AvgSalary
--From EmployeeSalary

--Select EmployeeID, JobTitle, Salary
--From EmployeeSalary
--Where EmployeeID In (
--Select EmployeeID
--From EmployeeDemographics
--Where Age > 30 
--)