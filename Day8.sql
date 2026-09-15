CREATE DATABASE day8;
USE day8;
CREATE TABLE employee(
  id INT PRIMARY KEY,
  name VARCHAR(50) NOT NULL,
  salary INT
);

INSERT INTO employee VALUES
(1,"aziz0",20000),
(2,"aziz1",23455),
(3,"aziz2",18900),
(4,"aziz3",20100),
(5,"aziz4",34000),
(6,"aziz5",23000),
(7,"aziz6",20000),
(8,"aziz7",20000);
SELECT*FROM employee;

ALTER TABLE employee
ADD department VARCHAR(50);

UPDATE employee
SET department = 'IT'
WHERE id = 1;

UPDATE employee
SET department = 'IT'
WHERE id = 2;
CREATE INDEX idx_employee_department
ON employee(department);
EXPLAIN
SELECT *
FROM employee
WHERE department = 'IT';


UPDATE employee
SET department = 'MANAGER'
WHERE id = 3;

UPDATE employee
SET department = 'SALES'
WHERE id = 4;

UPDATE employee
SET department = 'SALES'
WHERE id = 5;

UPDATE employee
SET department = 'IT'
WHERE id = 6;

UPDATE employee
SET department = 'HR'
WHERE id = 7;

UPDATE employee
SET department = 'IT'
WHERE id = 8;

UPDATE employee
SET department = 'SALES'
WHERE id = 9;

SELECT * , FIRST_VALUE(salary) OVER(
ORDER BY salary ASC
) AS lowest_salary
FROM employee;

SELECT * , FIRST_VALUE(salary) OVER(
PARTITION BY department
ORDER BY salary DESC
) AS dept_highest_salary
FROM employee;


SELECT * , LAST_VALUE(salary) OVER(
ORDER BY salary ASC
ROWS BETWEEN UNBOUNDED PRECEDING
AND UNBOUNDED FOLLOWING
) AS highest_salary
FROM employee;

SELECT * , NTILE(4) OVER(
ORDER BY salary ASC
)AS salary_group
FROM employee;

SELECT name,UPPER(name)
AS upercase_name
FROM employee;

SELECT name,LOWER(name)
AS upercase_name
FROM employee;


SELECT name,LENGTH(name) 
AS name_length
FROM employee;

SELECT
    CHAR_LENGTH('বাংলা') AS character_count,
    LENGTH('বাংলা') AS byte_count;
    
    
SELECT CONCAT(
name, ' - ',department
) AS employee_info
FROM employee;


SELECT CONCAT_WS(
' - ',
name,department,salary
) AS employee_info
FROM employee;


SELECT name,SUBSTRING(
name,1,3
) AS first_three
FROM employee;

SELECT name,LEFT(name,4)
AS begining_four
FROM employee;

SELECT name ,RIGHT(name,3)
AS last_three
FROM employee;

SELECT TRIM('  Sk Azizul Hosen   ');

SELECT REPLACE('i love java','java','sql');

SELECT name , LOCATE('i',name) 
AS i_position
FROM employee;