
CREATE DATABASE hr_system;
USE hr_system;
CREATE TABLE employes (
    id INT PRIMARY KEY,
    name VARCHAR(100),
    department VARCHAR(50),
    salary DECIMAL(10, 2)
);

INSERT INTO employes (id, name, department, salary) VALUES
(1, 'Alice', 'Engineering', 75000),
(2, 'Bob', 'Marketing', 65000),
(3, 'Charlie', 'Engineering', 80000);

UPDATE employes
SET salary = 70000
WHERE name = 'Bob';

SELECT * FROM employes
WHERE department = 'Engineering';

DELETE FROM employes
WHERE id = 3;

ALTER TABLE employees
ADD appraisal_percentage DECIMAL(5, 2);
