-- Drop existing tables if they exist to avoid errors
DROP TABLE IF EXISTS employees;
DROP TABLE IF EXISTS departments;

-- DEPARTMENTS table creation
CREATE TABLE departments (
    department_id INT AUTO_INCREMENT PRIMARY KEY,
    department_name VARCHAR(100) NOT NULL
);

-- EMPLOYEES table creation
CREATE TABLE employees (
    employee_id INT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(100) NOT NULL,
    department_id INT NULL,  -- Allow NULL values for department_id
    salary DECIMAL(10,2),
    FOREIGN KEY (department_id) REFERENCES departments(department_id)
);

-- Insert sample data into departments
INSERT INTO departments (department_name)
VALUES 
    ('HR'), 
    ('Finance'), 
    ('IT'), 
    ('Marketing');

-- Insert sample data into employees
INSERT INTO employees (name, department_id, salary)
VALUES 
    ('Alice', 1, 50000),
    ('Bob', 2, 60000),
    ('Charlie', 3, 70000),
    ('David', NULL, 40000),  -- This entry is now valid with department_id = NULL
    ('Eve', 4, 65000);
    
    SELECT employees.name, departments.department_name, employees.salary
FROM employees
INNER JOIN departments
ON employees.department_id = departments.department_id;

SELECT employees.name, departments.department_name, employees.salary
FROM employees
LEFT JOIN departments
ON employees.department_id = departments.department_id;

SELECT employees.name, departments.department_name, employees.salary
FROM employees
RIGHT JOIN departments
ON employees.department_id = departments.department_id;


