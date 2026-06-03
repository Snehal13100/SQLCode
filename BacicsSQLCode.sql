--********************* DAY-1 **************************

-- 1. Create database SQLCODE

CREATE DATABASE SQLCODE;

USE SQLCODE;
-- 2. Create table Employee
-- Columns:
-- Id, Name, Email, Salary, Department, City, CreatedOn

CREATE TABLE Employee (
 Id INT PRIMARY KEY,
 Name VARCHAR(50),
 Email VARCHAR(100),
 Salary DECIMAL,
 Department VARCHAR(50),
 City VARCHAR(50),
 CreatedOn DATETIME DEFAULT GETDATE());

 -- 3. Insert 5 employee records

INSERT INTO Employee (Id, Name, Email, Salary, Department, City)
VALUES
(1, 'Amit Sharma', 'amit@gmail.com', 35000.00, 'IT', 'Pune'),
(2, 'Priya Patil', 'priya@gmail.com', 42000.00, 'HR', 'Mumbai'),
(3, 'Rahul Deshmukh', 'rahul@gmail.com', 50000.00, 'Finance', 'Nagpur'),
(4, 'Neha Joshi', 'neha@gmail.com', 38000.00, 'Marketing', 'Nashik'),
(5, 'Snehal Tirpude', 'snehal@gmail.com', 45000.00, 'Development', 'Pune');


-- 4. Show all employees
SELECT * FROM Employee;

-- 5. Show only Name and Salary

SELECT Name, Salary FROM Employee;

-- 6. Show employees from Pune

SELECT NAME,CITY FROM Employee WHERE CITY='PUNE';

-- 7. Show employees whose Salary > 30000

SELECT NAME ,SALARY FROM Employee WHERE Salary>30000;

-- 8. Update Salary of employee Id = 2

UPDATE Employee SET SALARY = 15000 WHERE ID=2;

-- 9. Delete employee Id = 5

DELETE Employee WHERE ID=3;

-- 10. Show final table data
SELECT * FROM Employee;


--***************DAY-2*********************

CREATE TABLE STUDENTS (
Id INT PRIMARY KEY,
NAME VARCHAR(50),
EMAIL VARCHAR(50),
AGE INT ,
CITY VARCHAR(50),
CreatedOn DATETIME DEFAULT GETDATE()
);


INSERT INTO STUDENTS (Id, Name, Email, Age, City)
VALUES
(1, 'Snehal', 'snehal@gmail.com', 23, 'Pune'),
(2, 'Amit', 'amit@gmail.com', 21, 'Mumbai'),
(3, 'Priya', 'priya@gmail.com', 22, 'Nagpur'),
(4, 'Rahul', 'rahul@gmail.com', 24, 'Nashik'),
(5, 'Neha', 'neha@gmail.com', 20, 'Pune');

-
-- 1. Add column Department in Student table

ALTER TABLE STUDENTS ADD  DEPARTMENT VARCHAR(100);

-- 2. Add column Marks in Student table
ALTER TABLE STUDENTS ADD MARKS INT;

--DROP COLUMNS FROM TABLE

ALTER TABLE STUDENTS
DROP COLUMN DEPARTMENT,MARKS;

-- 3. Update Department And Marks for all students

UPDATE STUDENTS SET DEPARTMENT=	'Computer',MARKS=99 WHERE Id=1;
UPDATE STUDENTS SET DEPARTMENT='IT',MARKS=70 WHERE ID=2;
UPDATE STUDENTS SET DEPARTMENT='Mech', MARKS=80 WHERE ID=3;
UPDATE STUDENTS SET DEPARTMENT='Civil', MARKS=86 WHERE ID=4;
UPDATE STUDENTS SET DEPARTMENT='IT', MARKS=97 WHERE ID=5;
UPDATE STUDENTS SET DEPARTMENT=	'Computer',MARKS=69 WHERE Id=3;



-- 5. Show students whose Marks are less than 90

SELECT * FROM STUDENTS WHERE MARKS<90;

-- 5. Show students whose Marks are greater than 70
SELECT * FROM STUDENTS WHERE MARKS>70;

-- 7. Show students by Marks highest to lowest (DESC)

SELECT MARKS FROM STUDENTS ORDER BY MARKS DESC;

-- 8. Show unique departments

SELECT DISTINCT DEPARTMENT FROM STUDENTS;

-- 9. Show top 3 students by marks
SELECT TOP 3 * FROM STUDENTS ORDER BY MARKS DESC;

-- 10. Add PhoneNumber column
ALTER TABLE STUDENTS ADD  PhoneNumber VARCHAR(15);

-- 11. Update PhoneNumber for only 3 students

UPDATE STUDENTS SET PhoneNumber=8010026478 WHERE ID=1;
UPDATE STUDENTS SET PhoneNumber=8738826478 WHERE ID=2;
UPDATE STUDENTS SET PhoneNumber=6729292762 WHERE ID=3;


-- 12. Show students whose PhoneNumber IS NULL
SELECT Name,PhoneNumber FROM STUDENTS WHERE PhoneNumber IS NULL;

-- 13. Show students whose PhoneNumber IS NOT NULL
SELECT NAME FROM STUDENTS WHERE PhoneNumber IS NOT NULL;

-- 14. Update multiple rows at a time
UPDATE STUDENTS SET City='Nagpur' WHERE ID IN (1,4);

-- 15. Delete one student record
DELETE STUDENTS WHERE ID=5; 

--******************* DAY-3 ***************************
-- 1. Show students from Nagpur and marks greater than 70

SELECT NAME,CITY,MARKS FROM STUDENTS WHERE CITY='NAGPUR' AND MARKS>70;

-- 2. Show students from Nagpur or MUMBAI
SELECT * FROM STUDENTS WHERE CITY='NAGPUR' OR CITY='MUMBAI';

-- 3. Show students not from Pune
INSERT INTO STUDENTS (Id, Name, Email, Age, City,DEPARTMENT,PhoneNumber)
VALUES (5, 'lata', 'lata@gmail.com', 22, 'Pune','Mech',80869455);

SELECT * FROM STUDENTS WHERE NOT CITY='PUNE';

-- 4. Show students whose marks are between 60 and 80
SELECT * FROM STUDENTS WHERE MARKS BETWEEN 60 AND 80;

-- 5. Show students whose name starts with A
SELECT * FROM STUDENTS WHERE NAME LIKE('A%');

-- 6. Count total students
SELECT COUNT(*) AS TotalStudent FROM STUDENTS;

-- 7. Find total marks
SELECT SUM(MARKS) AS TotalMarks FROM STUDENTS;

-- 8. Find average marks
SELECT AVG(MARKS) AS AvgMarks FROM STUDENTS;

-- 9. Find lowest marks
SELECT MIN(MARKS) AS LowestMarks FROM STUDENTS;
-- 10. Find highest marks
SELECT MAX(MARKS) AS HighestMarks FROM STUDENTS;

-- 11. Count students department-wise

SELECT Department, COUNT(*) AS TotalStudents
FROM STUDENTS
GROUP BY Department;

-- 12. Count students city-wise
SELECT City, COUNT(*) AS TotalStudents
FROM STUDENTS
GROUP BY City;

-- 13. Find average marks department-wise
SELECT Department, AVG(Marks) AS AverageMarks
FROM STUDENTS
GROUP BY Department;

-- 14. Show departments having more than 1 student
SELECT Department, COUNT(*) AS TotalStudents
FROM STUDENTS
GROUP BY Department
HAVING COUNT(*) > 1;

-- 15. Show top 3 students by marks

SELECT TOP 3 *
FROM STUDENTS
ORDER BY Marks DESC;