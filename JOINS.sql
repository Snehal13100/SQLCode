CREATE DATABASE JOINS;
USE JOINS;

CREATE TABLE Student
(
    StudentId INT IDENTITY(1,1) PRIMARY KEY,
    StudentName VARCHAR(100),
    Email VARCHAR(50),
    City VARCHAR(50)
    
);
CREATE TABLE Courses
(
    CourseId INT PRIMARY KEY,
    CourseName VARCHAR(100),
    StudentId INT
);


INSERT INTO Student (StudentName, Email, City)
VALUES
('Snehal', 'snehal@gmail.com', 'Pune'),
('Rahul', 'rahul@gmail.com', 'Mumbai'),
('Amit', 'amit@gmail.com', 'Nashik'),
('Pooja', 'pooja@gmail.com', 'Nagpur'),
('Neha', 'neha@gmail.com', 'Pune');

SELECT * FROM Student;

INSERT INTO Courses (CourseId, CourseName, StudentId)
VALUES
(1, 'SQL', 1),
(2, 'C#', 2),
(3, 'Angular', 3),
(4, 'HTML', 4),
(5, 'CSS', 6 ),
(6,'JS',8);

SELECT * FROM Courses;
-- JOIN: Combines data from two or more tables using a related column.

-- 1. INNER JOIN : Returns only matching records from both tables.

SELECT * FROM 
Student as s
INNER JOIN Courses as c
ON s.StudentId = c.StudentId;

--2.LEFT JOIN : Returns all records from the left table and matching records from the right table.
SELECT *
FROM Student as s
LEFT JOIN Courses as c
ON s.StudentId=c.StudentId;

--3. RIGHT JOIN : Returns all records from the right table and matching records from the left table.
SELECT *
FROM Student as s
RIGHT JOIN Courses as c
ON s.StudentId=c.StudentId;

--4. FULL OUTER JOIN : Returns all records from both tables, matching and non-matching.

SELECT * 
FROM Student as s
FULL JOIN Courses as c 
ON s.StudentId=c.StudentId;

--5. LEFT EXCLUSIVE JOIN : Show records that are present in left table only, but not matching in right table.

SELECT * 
FROM Student as s
LEFT JOIN Courses as c 
ON s.StudentId = c.StudentId
WHERE c.StudentId IS NULL;

-- 6. RIGHT EXCLUSIVE JOIN: 

SELECT * FROM
Student as s 
RIGHT JOIN Courses as c
ON s.StudentId=c.StudentId
WHERE s.StudentId IS NULL;

-- 7. SELF JOIN : means joining a table with itself.
CREATE TABLE Employee
(
    EmpId INT PRIMARY KEY,
    EmpName VARCHAR(50),
    ManagerId INT
);
INSERT INTO Employee (EmpId, EmpName, ManagerId)
VALUES
(1, 'Snehal', NULL),
(2, 'Amit', 1),
(3, 'Neha', 1),
(4, 'Rahul', 2),
(5, 'Pooja', 2);

SELECT * FROM Employee;

SELECT 
 e.EmpName AS EmployeeName,
 m.EmpName AS ManagerName
FROM Employee e
JOIN Employee m
ON  m.EmpId= e.ManagerId;