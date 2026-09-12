CREATE DATABASE day5;
USE day5;
CREATE TABLE employee(
  id INT,
  name VARCHAR(50),
  department VARCHAR(50),
  salary INT
);

INSERT INTO employee VALUES
(1,"aziz0","IT",20000),
(2,"aziz1","IT",23455),
(3,"aziz2","HR",18900),
(4,"aziz3","HR",20100),
(5,"aziz4","CEO",34000),
(6,"aziz5","MARKETING",23000),
(7,"aziz6","MARKETING",20000),
(8,"aziz7","IT",20000);

SELECT* FROM employee;

SELECT name,department
FROM employee
WHERE department = 'IT'
UNION
SELECT name, department
FROM employee
WHERE department = 'HR';

SELECT name,department
FROM employee
WHERE department = 'IT'
UNION ALL
SELECT name, department
FROM employee
WHERE department = 'HR';

SELECT name,salary
FROM employee
WHERE department = 'IT'
UNION
SELECT name, salary
FROM employee
WHERE department = 'MARKETING';


SELECT name 
FROM employee
WHERE department = 'IT'
UNION
SELECT name 
FROM employee
WHERE department = 'IT';

SELECT name 
FROM employee
WHERE department = 'IT'
UNION ALL
SELECT name 
FROM employee
WHERE department = 'IT';


SELECT *
FROM employee e1
WHERE EXISTS(
SELECT 1
FROM employee e2
WHERE e2.department = e1.department AND
e2.salary > 21000
);

SELECT *
FROM employee e1
WHERE NOT EXISTS(
SELECT 1
FROM employee e2
WHERE e2.department = e1.department
AND e2.salary > 50000
);

SELECT * 
FROM employee e1
WHERE EXISTS (
SELECT 1
FROM employee e2
WHERE e2.department = e1.department
AND e2.department = 'IT'
);

SELECT * 
FROM employee e1
WHERE EXISTS (
SELECT 1
FROM employee e2
WHERE e2.department = e1.department
AND e2.salary > 30000
);


CREATE TABLE department (
    department_id INT,
    department_name VARCHAR(50)
);


INSERT INTO department (department_id, department_name)
VALUES
(1, 'IT'),
(2, 'HR'),
(3, 'SALES'),
(4, 'MARKETING'),
(5, 'CEO');
SELECT * FROM employee;
SELECT * FROM department;

SELECT employee.name,
department.department_name,
employee.salary
FROM employee
INNER JOIN department
ON employee.department = department.department_name;

SELECT employee.name,
employee.salary
FROM employee
INNER JOIN department
ON employee.department = department.department_name
WHERE employee.department = 'IT';

SELECT employee.name,
department.department_name,
employee.salary
FROM employee
INNER JOIN department
ON employee.department = department.department_name
WHERE employee.department = 'IT' AND
employee.salary > 20000;

SELECT department.department_name,
employee.name,
employee.salary
FROM employee
RIGHT JOIN department
ON employee.department = department.department_name;


CREATE TABLE location (
    location_id INT,
    city VARCHAR(50)
);

INSERT INTO location (location_id, city)
VALUES
(1, 'Kolkata'),
(2, 'Delhi'),
(3, 'Mumbai'),
(4, 'Bangalore'),
(5, 'Chennai');

ALTER TABLE department
ADD location_id INT;
ALTER TABLE department
ADD PRIMARY KEY (department_id);
UPDATE department
SET location_id = 1
WHERE department_id = 1;
UPDATE department
SET location_id = 2
WHERE department_id = 2;

UPDATE department
SET location_id = 3
WHERE department_id = 3;

UPDATE department
SET location_id = 4
WHERE department_id = 4;

UPDATE department
SET location_id = 5
WHERE department_id = 5;
SELECT* FROM department;


SELECT e.name,
d.department_name,
l.city
FROM employee e
INNER JOIN department d
ON e.department = d.department_name
INNER JOIN location l
ON d.department_id = l.location_id;

-- task 1
SELECT e.name,
l.city,
e.salary
FROM employee e
INNER JOIN department d
ON e.department = d.department_name
INNER JOIN location l
ON d.location_id = l.location_id
WHERE e.department = 'IT'
ORDER BY e.salary DESC;


ALTER TABLE employee
ADD manager_id INT;
ALTER TABLE employee
ADD PRIMARY KEY (id);
UPDATE employee
SET manager_id = 1
WHERE id IN (2, 5, 8);
UPDATE employee
SET manager_id = 2
WHERE id IN (6, 7);
SELECT id, name, manager_id
FROM employee;


-- task
SELECT e.name AS employee_name,
m.name AS manager_name,
e.salary AS salary
FROM employee e
INNER JOIN employee m
ON e.manager_id = m.id;



DESC employee;