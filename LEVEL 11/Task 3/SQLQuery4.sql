
USE hr_system_joins;

INSERT INTO employees (id, name, department, salary) VALUES
(6, 'Fiona', 'Sales', 50000),
(7, 'George', 'Sales', 48000);

SELECT department, AVG(salary) AS avg_salary
FROM employees
WHERE department = 'Engineering'
GROUP BY department;

SELECT department, AVG(salary) AS avg_salary
FROM employees
GROUP BY department
HAVING AVG(salary) > 60000;

SELECT e.id, e.name, e.department, e.salary
FROM employees e
INNER JOIN departments d
ON e.department = d.department_name;

SELECT e.id, e.name, e.department, d.department_name
FROM employees e
LEFT JOIN departments d
ON e.department = d.department_name;

SELECT e.id, e.name, e.department, d.department_name
FROM employees e
RIGHT JOIN departments d
ON e.department = d.department_name;

SELECT e.id, e.name, e.department, d.department_name
FROM employees e
LEFT JOIN departments d
ON e.department = d.department_name

UNION

SELECT e.id, e.name, e.department, d.department_name
FROM employees e
RIGHT JOIN departments d
ON e.department = d.department_name;




