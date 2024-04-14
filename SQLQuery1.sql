--CREATE TABLE EmployeeDemographics
--(EmployeeID int,
--FirstName varchar(50),
--LastName varchar(50),
--Age int,
--Gender varchar(50)
--)

--CREATE TABLE EmployeeSalary
--(EmployeeID int,
--JobTitle varchar(50),
--Salary int)

--CREATE TABLE WareHouseEmployeeDemographics
--(EmployeeID int,
--FirstName varchar(50),
--LastName varchar(50),
--Age int,
--Gender varchar(50))

--INSERT INTO WareHouseEmployeeDemographics VALUES
--(1013, 'Darryl', 'Philbin', Null, 'Male'),
--(1050, 'Roy', 'Anderson', 31, 'Male'),
--(1051, 'Hidetoshi', 'Hasagawa', 40, 'Male'),
--(1052, 'Val', 'Johnson', 31, 'Female')

--INSERT INTO EmployeeDemographics VALUES
--(1001,  'Jim', 'Halpert', 30, 'Male')

--INSERT INTO EmployeeDemographics VALUES
--(1002, 'Pam', 'Beasley',30,'Female'),
--(1003, 'Dwight', 'Schrute',29,'Male'),
--(1004, 'Angela', 'Martin',31,'Female'),
--(1005, 'Toby', 'Flenderson',32,'Male'),
--(1006, 'Michael', 'Scott',35,'Male'),
--(1007, 'Meredith', 'Palmer',32,'Female'),
--(1008, 'Stanley', 'Hudson',38,'Male'),
--(1009, 'Kevin', 'Malone',31,'Male')

--INSERT INTO EmployeeDemographics VALUES
--(1011, 'Ryan', 'Howard', 26, 'Male'),
--(Null,'Holly', 'Flax',Null,Null),
--(1013, 'Darryl', 'Philbin', Null, 'Male')

--INSERT INTO EmployeeSalary VALUES
--(1001,'Salesman', 45000),
--(1002,'Receptionist', 36000),
--(1003,'Salesman', 63000),
--(1004,'Accountant', 47000),
--(1005,'HR', 50000),
--(1006,'Regional Manager', 65000),
--(1007,'Supplier Relations', 41000),
--(1008,'Salesman', 48000),
--(1009,'Accountant', 42000)

--INSERT INTO EmployeeSalary VALUES
--(1010, Null, 47000),
--(Null, 'Salesman', 43000)

/*///////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
Select Statement
* = selects all, 
Top = with a numerical value it selects the top of the list, 
Distinct = Selects all unique values, 
Count = Show all non null values, 
As = creates an alias for a column, 
Max = Selects the max of a column, 
Min = selects the min of a column, 
Avg = creates the average from a column
*/

/*////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
Where Statement
= = selects the value that equals the input ex: FirstName = 'Jim',
<> = does not equal ex: FirstName <> 'Jim',
< = less than ex: Age < 30,
> = greater than ex: Age > 30,
And = must have both statements ex: FirstName = 'Jim' AND FirstName = 'Michael',
Or = will return either statement but must not have both ex: FirstName = 'Jim' OR FirstName = 'Michael',
Like = Utilizes %(wild cards) to find data but unsure of the spelling ex: FirstName LIKE 'Ji%',
Null = Finds data where there is a null value ex: FirstName is NULL,
Not Null = Finds data where value is not a null value ex: FirstName is NOT NULL,
In = a condensed way of using '=' and 'AND' ex: FirstName IN ('Jim', 'Michael')
*/

/*/////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
Group By = selects all unique data, Reduces number of rows by rolling up output and calculating sums ex: GROUP BY Gender will out put m and f,
Order BY = orders the data automatically from ASC meaning small to large as opposed to DESC which is large to small,
*/

SELECT Gender, Age, COUNT(Gender) /*COUNT must be here and not in group by because it is not a real column*/
FROM EmployeeDemographics
GROUP BY Gender, Age

SELECT Gender, COUNT(Gender)
FROM EmployeeDemographics
WHERE Age > 30
GROUP BY Gender

SELECT *
FROM EmployeeDemographics
ORDER BY Age ASC, Gender DESC  /* Same query as the one below */

SELECT *
FROM EmployeeDemographics
ORDER BY 4 ASC, 5 DESC		/* Same query as the one above, Best for smaller tables */ 

/*///////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
Inner Joins = Default Join returns matching data from both tables,
Left Outer Join = Returns everything from the LEFT table and anything overlapping but if it's only in the RIGHT table it is not returned,
Right Outer Join = Returns everything from the RIGHT table and anything overlapping but if it's only in the LEFT table it is not returned,
Full Outer Join = returns all values from both tables regardless of matching
*/

SELECT *
FROM EmployeeDemographics

SELECT *
FROM EmployeeSalary

SELECT *
FROM EmployeeDemographics /* This is the LEFT table */
LEFT OUTER JOIN EmployeeSalary /* This is the RIGHT table */
	ON EmployeeDemographics.EmployeeID = EmployeeSalary.EmployeeID


SELECT *
FROM EmployeeDemographics /* This is the LEFT table */
RIGHT OUTER JOIN EmployeeSalary /* This is the RIGHT table */
	ON EmployeeDemographics.EmployeeID = EmployeeSalary.EmployeeID

SELECT EmployeeDemographics.EmployeeID, FirstName, LastName, JobTitle, Salary
FROM EmployeeDemographics
INNER JOIN EmployeeSalary
ON EmployeeDemographics.EmployeeID = EmployeeSalary.EmployeeID

SELECT EmployeeSalary.EmployeeID, FirstName, LastName, JobTitle, Salary /* Utilizes the all data in the RIGHT table EmployeeID and Null everything not represented in the LEFT */
FROM EmployeeDemographics
RIGHT OUTER JOIN EmployeeSalary
ON EmployeeDemographics.EmployeeID = EmployeeSalary.EmployeeID

SELECT EmployeeDemographics.EmployeeID, FirstName, LastName, JobTitle, Salary /* Utilizes the LEFT table EmployeeID and but still utilizes everything from the RIGHT Table and Null everything not represented in the LEFT */
FROM EmployeeDemographics
RIGHT OUTER JOIN EmployeeSalary
ON EmployeeDemographics.EmployeeID = EmployeeSalary.EmployeeID

SELECT EmployeeSalary.EmployeeID, FirstName, LastName, JobTitle, Salary /* Utilizes the all data in the LEFT table EmployeeID and Null everything not represented in the RIGHT */
FROM EmployeeDemographics
LEFT OUTER JOIN EmployeeSalary
ON EmployeeDemographics.EmployeeID = EmployeeSalary.EmployeeID

SELECT EmployeeDemographics.EmployeeID, FirstName, LastName, JobTitle, Salary /* Utilizes the LEFT table EmployeeID and but still utilizes everything from the RIGHT Table and Null everything not represented in the LEFT */
FROM EmployeeDemographics
LEFT OUTER JOIN EmployeeSalary
ON EmployeeDemographics.EmployeeID = EmployeeSalary.EmployeeID

SELECT EmployeeDemographics.EmployeeID, FirstName, LastName, Salary /* Finds the highest salary of known EmployeeID's and Names combining two tables */
FROM EmployeeDemographics
INNER JOIN EmployeeSalary
	ON EmployeeDemographics.EmployeeID = EmployeeSalary.EmployeeID
WHERE FirstName <> 'Michael'
ORDER BY Salary DESC

SELECT JobTitle, AVG(Salary) AS Average_Salary /* By commbining both tables, this query finds the average salary for all Salesman with the appropriate crednetials */
FROM EmployeeDemographics
INNER JOIN EmployeeSalary
	ON EmployeeDemographics.EmployeeID = EmployeeSalary.EmployeeID
WHERE JobTitle = 'Salesman'
GROUP BY JobTitle

/*///////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
Today's Topic:
Union = Rather than JOIN(connects two tables side by side) UNION combines the two tables into one table (It gets rid of duplicates),
Union All = Does the same as UNION but allows duplicates,
*/

SELECT *
FROM EmployeeDemographics
FULL OUTER JOIN WareHouseEmployeeDemographics
 ON EmployeeDemographics.EmployeeID = WareHouseEmployeeDemographics.EmployeeID


SELECT *            /* Combines the two tables together with no duplicates*/
FROM EmployeeDemographics
UNION
SELECT *
FROM WareHouseEmployeeDemographics

SELECT *            /* Combines the two tables together with duplicates*/
FROM EmployeeDemographics
UNION
SELECT *
FROM WareHouseEmployeeDemographics

SELECT EmployeeID, FirstName, Age    /* This combines two table with different colummns, this works because they have similar colummns */
FROM EmployeeDemographics	         /* BECAREFUL because this is wrong to do */
UNION
SELECT EmployeeID, JobTitle, Salary
FROM EmployeeSalary
ORDER BY EmployeeID 

/*////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
Today's Topic:
Case Statement = Essentially an if statement that creates colummns and can manipulate data.
*/

SELECT FirstName, LastName, Age,	/* A query that uses CASE to create labels for different age brackets */
CASE
	WHEN Age = 38 THEN 'Old'
	WHEN Age > 30 THEN 'Middle Age'
	When Age BETWEEN 27 AND 30 THEN 'Young'
	ELSE 'Baby'
END AS Age_Label
FROM EmployeeDemographics
WHERE Age IS NOT NULL
ORDER BY Age 

SELECT FirstName, LastName, JobTitle, Salary,		/* A Query that combines two tables and uses CASE to find different JobTitles to determine a Raise */
CASE
	WHEN JobTitle = 'Salesman' THEN Salary + (Salary * 0.10)
	WHEN JobTitle = 'HR' THEN Salary + (Salary * 0.000000001)
	WHEN JobTitle = 'Accountant' THEN Salary + (Salary * 0.05)
	ELSE Salary + (Salary * 0.03)
END AS Salary_Raise
FROM EmployeeDemographics
INNER JOIN EmployeeSalary
	ON EmployeeDemographics.EmployeeID = EmployeeSalary.EmployeeID
ORDER BY Salary

/*///////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
Today's Topic:
Having Clause = is Used to compare non-columns, This is used to compare against aggregated columns
*/

SELECT JobTitle, COUNT(JobTitle) /* Example of a wrong query and why HAVING is necessary */
FROM EmployeeDemographics
INNER JOIN EmployeeSalary
	ON EmployeeDemographics.EmployeeID = EmployeeSalary.EmployeeID
WHERE COUNT(JobTitle) > 1
GROUP BY JobTitle

SELECT JobTitle, COUNT(JobTitle) /* Also Wrong */
FROM EmployeeDemographics
INNER JOIN EmployeeSalary
	ON EmployeeDemographics.EmployeeID = EmployeeSalary.EmployeeID
HAVING COUNT(JobTitle) > 1
GROUP BY JobTitle

SELECT JobTitle, COUNT(JobTitle) /* SOLUTION: HAVING must be below GROUP BY because it is dependent upon aggregation */
FROM EmployeeDemographics
INNER JOIN EmployeeSalary
	ON EmployeeDemographics.EmployeeID = EmployeeSalary.EmployeeID
GROUP BY JobTitle
HAVING COUNT(JobTitle) > 1

SELECT JobTitle, AVG(Salary) /* SOLUTION: HAVING must be below GROUP BY because it is dependent upon aggregation */
FROM EmployeeDemographics
INNER JOIN EmployeeSalary
	ON EmployeeDemographics.EmployeeID = EmployeeSalary.EmployeeID
GROUP BY JobTitle
HAVING AVG(Salary) > 45000
ORDER BY AVG(Salary)

/*//////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
Today's Topic:
Updating =  updates a column,
Deleting Data = Removes an entire row from a table, Use SELECT to make sure the data desired is deleted. DELETE is  no recoverable.
*/

SELECT *
FROM EmployeeDemographics

UPDATE EmployeeDemographics
SET EmployeeID = 1012
WHERE FirstName = 'Holly'

UPDATE EmployeeDemographics	
SET Age = 31, Gender = 'Female'
WHERE EmployeeID = 1012

DELETE FROM EmployeeDemographics
WHERE EmployeeID = 1005

/*/////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
Today's Topic:
Aliasing = Creates a new column name
*/

SELECT FirstName + ' ' + LastName AS FullName
FROM EmployeeDemographics

SELECT AVG(Age) AS avgAge
FROM EmployeeDemographics

SELECT Demo.EmployeeID, Sal.Salary
FROM EmployeeDemographics AS DEMO
JOIN EmployeeSalary AS Sal 
	ON Sal.EmployeeID = Demo.EmployeeID

SELECT Demo.EmployeeID, Demo.FirstName, Sal.JobTitle, Ware.Age
FROM EmployeeDemographics AS Demo
LEFT JOIN EmployeeSalary AS Sal
	ON Demo.EmployeeID = Sal.EmployeeID
LEFT JOIN WareHouseEmployeeDemographics AS Ware
	ON Demo.EmployeeID = Ware.EmployeeID


/*/////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
Today's Topic:
Partition By = Compared to Group By, Partition is different in that it creates a new column for each instance and shows the total in the partition column
*/

SELECT FirstName, LastName, Gender, Salary,					/* Proper way to utilize PARTITION BY, Creates a column that states total number of genders */
	COUNT(Gender) OVER (PARTITION BY Gender) AS Gender_Count
FROM EmployeeDemographics AS Demo
JOIN EmployeeSalary AS Sal
	ON Demo.EmployeeID = Sal.EmployeeID

SELECT FirstName, LastName, Gender, Salary, COUNT(Gender)	/*  Reeason why PARTITION BY is Necessary, This groups each instance as its own count */
FROM EmployeeDemographics AS Demo
JOIN EmployeeSalary AS Sal
	ON Demo.EmployeeID = Sal.EmployeeID
GROUP BY FirstName, LastName, Gender, Salary

SELECT Gender, COUNT(Gender)								/* This is a Group By example that only shows male and female and their total count */
FROM EmployeeDemographics AS Demo
JOIN EmployeeSalary AS Sal
	ON Demo.EmployeeID = Sal.EmployeeID
GROUP BY Gender


/*/////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
Today's Topic:
Common Table Expression (CTE) or WITH Queries = Creates a table through a query that allows the user to work off of their desired query. Must be ran as a whole. SELECT must be right after the parantheses. CTE is created during each execution.
*/

WITH CTE_Employee AS
(SELECT FirstName, LastName, Gender, Salary,
	COUNT(Gender) OVER (PARTITION BY Gender) AS TotalGender,
	AVG(Salary) OVER (PARTITION BY Gender) as AvgSalary
FROM EmployeeDemographics AS Demo
JOIN EmployeeSalary	AS Sal
	ON Demo.EmployeeID = Sal.EmployeeID
WHERE Salary > '45000'
)
SELECT *
FROM CTE_Employee


/*/////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
Today's Topic:
Temp Tables = Creates a temporary table, can be used multiple times unlike CTEs(1 time) or Sub Queries(Write Multiple times within a query
*/

CREATE TABLE #temp_Emmployee (		/* Creates a temmp table */
EmployeeID int,
JobTitle varchar(100),
Salary int
)

SELECT *
FROM #temp_Emmployee

INSERT INTO #temp_Emmployee VALUES	/* example of inserting data into temmp table, not typical */
('1001', 'HR', '4500')

INSERT INTO #temp_Emmployee			/* Typical usecase, Big use for temp table. Insert Data into temp table and then hit off of temp table which has the sub section of data to use for later queries */
SELECT *
FROM EmployeeSalary	

DROP TABLE IF EXISTS #Temp_Employee2	/* Used a ton in Store Procedures for running multiple times, This deletes the existing temp table to create the table again. */
CREATE TABLE #Temp_Employee2 (
JobTitle varchar(50),
EmployeesPerJob Int,
AvgAge int,
AvgSalary int)

INSERT INTO #Temp_Employee2			/* No longer needs to run these two tables with the join and calculations, values are placed in the temp table which makes the process quicker */
SELECT JobTitle, COUNT(JobTitle), Avg(Age), AVG(Salary)
FROM EmployeeDemographics AS Demo
JOIN EmployeeSalary AS Sal
	ON Demo.EmployeeID = Sal.EmployeeID
GROUP BY JobTitle

SELECT *
FROM #Temp_Employee2


/*////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
Today's Topic: String Functions
Trim = Gets of white space from both the left side and the right side of a value,
LTRIM = Gets rid of the white space from the left side,
RTRIM = Gets rid of the white space from the right side,
Replace = This takes the desired value to replace and replaces the value with the correct value,
Substring = This takes a string value and takes a beginning and end range of the string to output the new string,
Upper = Turns a string value into all Uppercase,
Lower = Turns a string value into all Lowercase,
*/

CREATE TABLE EmployeeErrors (
EmployeeID varchar(50),
FirstName varchar(50),
LastName varchar(50)
)

INSERT INTO EmployeeErrors VALUES
('1001  ', 'Jimbo', 'Halbert'),
('  1002', 'Pamela', 'Beasely'),
('1005', 'TOby', 'Flenderson - Fired')

SELECT *
FROM EmployeeErrors

-- Using Trim, LTRIM, RTRIM

Select EmployeeID, TRIM(EmployeeID) as IDTrim
From EmployeeErrors	

Select EmployeeID, LTRIM(EmployeeID) as IDTrim
From EmployeeErrors	

Select EmployeeID, RTRIM(EmployeeID) as IDTrim
From EmployeeErrors	


-- Using Replace

Select LastName, REPLACE(LastName, '- Fired', '') as LastNameFixed
From EmployeeErrors	

Select LastName, REPLACE(LastName, 'Halbert', 'Halpert') as LastNameFixed
From EmployeeErrors

-- Using Substring

Select SUBSTRING(FirstName,1,3)
FROM EmployeeErrors	

Select SUBSTRING(FirstName,3,3)
FROM EmployeeErrors	

-- Fuzz Matching: Used to find matching data between two tables
-- For example: Used for Gender, LastName, Age, DOB

Select err.FirstName, demo.FirstName
From EmployeeErrors as err
Join EmployeeDemographics as demo
	on err.FirstName = demo.FirstName

Select err.FirstName, SUBSTRING(err.FirstName,1,3), demo.FirstName, SUBSTRING(demo.FirstName,1,3)
From EmployeeErrors as err
Join EmployeeDemographics as demo
	on SUBSTRING(err.FirstName,1,3) = SUBSTRING(demo.FirstName,1,3)

-- Using Upper and Lower

Select FirstName, LOWER(FirstName)
From EmployeeErrors

Select FirstName, UPPER(FirstName)
From EmployeeErrors

/*/////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
Today's Topic:
Stored Procedures = A group of SQL statements that have been created and stored in the database
- It can accept input parameters
- Can be used over the network by several different users and be using different input data
- Reduces network traffic and increase performance
- Any update to the stored procedure will affect everyone
*/

CREATE PROCEDURE  TEST    /* This creates a stored procedure and stores it in the working database under 'Programmability' */
AS
Select *
From EmployeeDemographics	

EXEC TEST				/* This Executes the store procedure that was created above */

CREATE PROCEDURE Temp_Emplpoyee				-- This Procedure creates a table and inserts the values into the table
AS
CREATE TABLE #temp_employee (
JobTitle varchar(100),
EmployeesPerJob int,
AvgAge int,
AvgSalary int
)

INSERT INTO #temp_employee
SELECT JobTitle, Count(JobTitle), Avg(Age), Avg(Salary)
From EmployeeDemographics as demo
Join EmployeeSalary as sal
	on demo.EmployeeID = sal.EmployeeID	
Group by JobTitle

Select *									-- This must be included so that there  is an actual output
From #temp_employee

EXEC Temp_Emplpoyee @JobTitle = 'Salesman'	-- @ is a parameter that was modified in the stored procedure, refer to 'Programmability' for the structure

/*///////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
Today's Topic:
Subqueries (in the Select, From, and Where Statement) = Often called Inner Queries or Nested Queries, essentially a query within a query
- Returns data that will be used in the main query or the outer query, as a condition to specify the data we want to retrieve
*/

Select * 
From EmployeeSalary

-- Subquery in Select

Select EmployeeID, Salary, (Select Avg(Salary) From EmployeeSalary) as allAvgSalary  -- Creates a new column that displays the all average salary in each row
From EmployeeSalary

-- How to do it with Partition By

Select EmployeeID, Salary, Avg(Salary) over () as allAvgSalary  -- Same exact output but done with partition by
From EmployeeSalary

-- Why Group By doesn't Work

Select EmployeeID, Salary, Avg(Salary) as allAvgSalary  -- Same exact output but done with partition by
From EmployeeSalary
Group By EmployeeID, Salary
Order by 1,2

-- Subquery in From
-- This creates an inner query that allows us to query off of it

Select *				--This is typically not used because subqueries are slower than temp tables or CTE's
From (Select EmployeeID, Salary, Avg(Salary) over () as allAvgSalary 
	  From EmployeeSalary)				-- Subqueries must be written out each time

Select a.EmployeeID, allAvgSalary
From (Select EmployeeID, Salary, Avg(Salary) over () as allAvgSalary 
	  From EmployeeSalary) as a

-- Subquery in Where

Select EmployeeID, JobTitle, Salary
From EmployeeSalary
Where EmployeeID in (
		Select EmployeeID					-- Only one column can be selected in the subquery
		From EmployeeDemographics
		Where Age > 30)						-- If age is a desired output, then the tables would need to be joined