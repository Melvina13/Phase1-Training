
CREATE DATABASE hr_system_joins;
USE hr_system_joins;

CREATE TABLE departments (
    department_id INT PRIMARY KEY,
    department_name VARCHAR(100)
);

INSERT INTO departments (department_id, department_name) VALUES
(1, 'Engineering'),
(2, 'HR'),
(3, 'Sales');

CREATE TABLE employees (
    id INT PRIMARY KEY,
    name VARCHAR(100),
    department VARCHAR(100),
    salary DECIMAL(10,2)
);

INSERT INTO employees (id, name, department, salary) VALUES
(1, 'Alice', 'Engineering', 75000),
(2, 'Bob', 'Marketing', 70000), 
(4, 'Diana', 'HR', 60000),
(5, 'Evan', NULL, 55000);

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
