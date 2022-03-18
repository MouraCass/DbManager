
-- 1. Write a query to display the name (first_name and last_name) and department ID of all
-- employees in departments 30 or 100 in ascending order.
/*
SELECT 
	first_name
	,last_name
	,department_id
FROM 
	employees
WHERE 
	department_id IN (30, 100)
ORDER BY 
	first_name ASC;
*/


-- 2. Write a query to find the manager ID and the salary of the lowest-paid employee for that
-- manager.
/*
SELECT 
	manager_id,MIN(salary)
FROM 
	employees
GROUP BY 
	manager_id;
*/

-- 3. Write a query to find the name (first_name and last_name) and the salary of the employees
-- who earn more than the employee whose last name is Bell.
/*
SELECT
	first_name, 
	,last_name
    ,salary
FROM 
	employees
WHERE 
	salary > (SELECT salary
              FROM employees 
              WHERE last_name = 'Bell')
ORDER BY 
	first_name;
*/

-- 4. Write a query to find the name (first_name and last_name), job, department ID and name of
-- all employees that work in London.
/*
SELECT 
	e.first_name
    ,e.last_name
    ,e.job_id
    ,e.department_id
    ,d.department_name
FROM 
	employees e
JOIN departments d ON (e.department_id = d.department_id)
JOIN locations l ON (d.location_id = l.location_id)
WHERE 
	l.city = 'London';
*/

-- 5. Write a query to get the department name and number of employees in the department.

SELECT 
	department_name AS 'Department Name' 
    ,COUNT(1) AS 'No of Employees' 
FROM 
	departments 
INNER JOIN
	 employees 
ON employees.department_id = departments.department_id 
GROUP BY departments.department_id, department_name 
ORDER BY
	 department_name;
