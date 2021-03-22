//ACTIVITY 04

SELECT last_name, department_id
FROM emps
WHERE department_id IN (20,50)
ORDER BY last_name;