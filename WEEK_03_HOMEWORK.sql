/*Home work
Write a query 
to display each 
department’s name, 
location, number of employees, 
and the average salary for all employees 
in that department.
Label the columns Name, Location, 
Number of People, and Salary, respectively.
Round the average salary to two decimal
places.
*/
SELECT d.Department_Name AS "Name", l.City AS "Location", COUNT(d.Department_id) AS "Number of People", cast(ROUND(AVG(e.Salary)) as decimal(16,2)) AS "Salary"
FROM emps e, depts d, locs l 
WHERE e.Department_Id=d.Department_id AND d.Location_id=l.Location_id 
GROUP BY d.Department_id;