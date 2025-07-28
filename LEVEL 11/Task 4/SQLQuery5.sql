
CREATE DATABASE  hr_payroll;
USE hr_payroll;



CREATE TABLE employees (
    id INT PRIMARY KEY,
    emp_name VARCHAR(100),
    department VARCHAR(100),
    salary DECIMAL(10,2)
);

REPLACE INTO employees (id, emp_name, department, salary) VALUES
(1, 'Alice', 'Engineering', 75000),
(2, 'Bob', 'Marketing', 70000),
(3, 'Charlie', 'Engineering', 80000),
(4, 'Diana', 'HR', 60000),
(5, 'Evan', NULL, 55000),
(6, 'Fiona', 'Sales', 50000),
(7, 'George', 'Sales', 48000);

CREATE TABLE department_stats (
    department VARCHAR(100) PRIMARY KEY,
    avg_salary DECIMAL(10,2)
);

DELIMITER //

CREATE PROCEDURE CalculateAvgSalary(IN dept_name VARCHAR(100))
BEGIN
    DECLARE avgSal DECIMAL(10,2);

    SELECT AVG(salary)
    INTO avgSal
    FROM employees
    WHERE department = dept_name;

    INSERT INTO department_stats (department, avg_salary)
    VALUES (dept_name, avgSal)
    ON DUPLICATE KEY UPDATE avg_salary = avgSal;
END;
//

DELIMITER ;

CALL CalculateAvgSalary('Engineering');

SELECT * FROM department_stats;
