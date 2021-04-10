//Activity 1
SELECT last_name , hire_date
FROM emps
WHERE hire_date LIKE '%1994%';

//Activity 2
SELECT last_name, salary, Commission_pct
From emps
WHERE Commission_pct is not null
ORDER BY Salary, Commission_pct DESC;

//Activity 3
SELECT last_name 
FROM emps
WHERE last_name LIKE "%a%" 
AND last_name LIKE "%e%"

//Activity 4
SELECT e.first_name , e.last_name , e.department_id , d.department_name 
FROM emps e
JOIN depts d 
ON e.department_id = d.department_id;

//Activity 5
SELECT e.last_name, d.department_name, d.location_id, l.city
FROM emps e, depts d, locs l
WHERE e.department_id = d.department_id
AND
d.location_id = l.location_id
AND e.commission_pct is not null;

//Activity 6
SELECT e.last_name, e.job_id, e.department_id,d.department_name
FROM emps e 
JOIN depts d
ON (e.department_id = d.department_id)
JOIN locs l
ON (d.location_id = l.location_id)
WHERE l.city = "toronto";

//Activity 7
SELECT last_name, salary, commission_pct
From emps
WHERE commission_pct is not null
ORDER BY Salary, commission_pct DESC;

//Activity 8
SELECT x.last_name "Employee", x.employee_id "EMP#",
y.last_name "Manager", y.employee_id "Mgr#"
FROM emps x join emps y
ON (x.manager_id = y.employee_id);

//Activity 9
SELECT ROUND(MAX(salary),0) 'Maximum', 
ROUND(MIN(salary),0) 'Minimum',
ROUND(SUM(salary),0) 'Sum',
ROUND(AVG(salary),0) 'Average'
FROM emps;

//Activity 10
SELECT job_id, SUM(salary), AVG(salary), MAX(salary), MIN(salary)
FROM emps 
GROUP BY job_id;

//Activity 11
SELECT job_id, COUNT(Job_Id)
FROM emps
GROUP BY job_id;

//Activity 12
SELECT manager_id, MIN(salary)
FROM emps
WHERE manager_id is not null
GROUP BY manager_id
ORDER BY MIN(salary) DESC;
