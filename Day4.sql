CREATE DATABASE day4;
USE day4;
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

SELECT department,COUNT(*) AS count
FROM employee
GROUP BY department
ORDER BY count DESC
LIMIT 1;

SELECT department,SUM(salary) AS sum
FROM employee
GROUP BY department
ORDER BY sum DESC
LIMIT 1;

SELECT department, AVG(salary) AS average
FROM employee
GROUP BY department
ORDER BY average ASC
LIMIt 1;

SELECT department,AVG(salary) AS avge
FROM employee
GROUP BY department
HAVING AVG(salary) > 30000
ORDER BY avge ASC;


	SELECT COUNT(DISTINCT department)
    FROM employee;
 
 SELECT name,salary,
 CASE
 WHEN salary < 20000 THEN "LOW"
 WHEN salary <= 30000 THEN "MEDIUM"
 WHEN salary > 30000 THEN "HIGH"
 END AS salary_level
 FROM employee;
 
 
 SELECT department,
 CASE
 WHEN department = "IT" THEN "TECHNICAL"
 WHEN department = "MARKETING" THEN "SALES"
 WHEN department = "HR" THEN "MANAGMENT"
 WHEN department = "CEO" THEN "OWNER"
 ELSE "OTHERS"
 END AS department_level
 FROM employee;
 
 
 SELECT
    CASE
        WHEN salary >= 30000 THEN 'High Salary'
        ELSE 'Regular Salary'
    END AS salary_category,
    COUNT(*) AS employee_count
FROM employee
GROUP BY
    CASE
        WHEN salary >= 30000 THEN 'High Salary'
        ELSE 'Regular Salary'
    END;
    
    
SELECT department,
       COUNT(*) AS total_employees,
       SUM(CASE
       WHEN salary > 30000 THEN 1
       ELSE 0
       END) AS high_salary_employee
FROM employee
GROUP BY department;  



SELECT*
FROM employee
WHERE salary > (
SELECT AVG(salary)
FROM employee
);

SELECT* FROM employee
WHERE salary = (
SELECT MIN(salary)
FROM employee
);

SELECT* 
FROM employee
WHERE department IN('IT','HR');


SELECT* FROM employee
WHERE salary IN(
SELECT MAX(salary)
FROM employee
UNION
SELECT MIN(salary)
FROM employee
)
ORDER BY salary DESC