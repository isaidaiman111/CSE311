Class Activity 1 

SELECT LAST_name, HIRE_Date FROM emps WHERE emps.Department_Id = (SELECT emps.Department_Id FROM emps WHERE emps.LAST_Name ="Zlotkey") AND emps.LAST_Name != "Zlotkey"

Class Activity 2 
 
SELECT Employee_Id, LAST_Name FROM `emps` WHERE salary > (SELECT AVG(salary) FROM emps)

Class Activity 3

SELECT emps.LAST_Name, emps.Salary
FROM emps
WHERE emps.Manager_id = (SELECT emps.Employee_Id FROM emps WHERE emps.LAST_Name = "King");

Class Activity 4

SELECT Employee_Id, LAST_Name, Salary FROM `emps` WHERE salary > (SELECT AVG(salary) FROM emps) AND LAST_Name LIKE "%u%";

Class Activity 5 

CREATE TABLE empnew ( id INT(4) NOT NULL PRIMARY KEY, fname VARCHAR(20), lname VARCHAR(20) )
INSERT INTO empnew (id, fname, lname)
VALUES 
(501, "Saida", "Iman"),
(502, "Ahnaf", "Abid"),
(503, "Sabiha", "Shorna"),
(504, "Tanvirul", "Hasan");
INSERT INTO empnew(id, fname, lname) SELECT Employee_Id, FIRST_Name, LAST_Name FROM emps

Class Activity 6 

CREATE TABLE EMP(ID Int(7), FIRST_Name Varchar(25), LAST_Name Varchar(25), Dept_ID Int(7))
a)ALTER TABLE emp MODIFY LAST_Name Varchar(30)
b)CREATE TABLE employees2(ID int(6), FIRST_Name Varchar(20), LAST_Name Varchar(25), Salary DECIMAL(8,2), DEPT_ID int(4))
c)DROP TABLE emp
d)RENAME TABLE employees2 TO EMP
e)ALTER TABLE emp DROP COLUMN FIRST_Name