//ACTIVITY 03


SELECT last_name , job_id, hire_date
FROM emps
WHERE hire_date > '20-FEB-1998' AND hire_date < '01-MAY-1998'
ORDER BY hire_date ASC;