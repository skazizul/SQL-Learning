CREATE DATABASE day6;
USE day6;

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


DELIMITER //

CREATE PROCEDURE getEmployee()
BEGIN
    SELECT * FROM employee;
END //

DELIMITER ;
CALL getEmployee();
CREATE INDEX index_name
ON employee(name);

SHOW INDEX FROM employee;


CREATE VIEW view1_salary AS
SELECT*FROM employee
WHERE salary > 20000;

SELECT*FROM view1_salary;

START TRANSACTION;
UPDATE employee
SET salary = 999999
WHERE id = 2;

SELECT * FROM employee
ROLLBACK;

DELIMITER //
CREATE PROCEDURE get_all_employee()
BEGIN
SELECT * FROM employee;
END //
DELIMITER ;

CALL get_all_employee();



DELIMITER //
CREATE PROCEDURE get_employee
(IN newid INT)
BEGIN
SELECT*FROM employee
WHERE id = newid;
END //
DELIMITER ;

SELECT * FROM employee
WHERE salary > (
SELECT AVG(salary)
FROM employee
);



WITH avg_salary AS(
SELECT AVG(salary) AS average_salary
FROM employee
)

SELECT* FROM employee
WHERE salary > (
SELECT average_salary
FROM avg_salary
);


WITH salary_high AS (
SELECT *
FROM employee
WHERE salary > 20000
)

SELECT * FROM salary_high;


WITH dept_avg AS(
SELECT department,
AVG(salary) AS average_dept
FROM employee
GROUP BY department
),

avg_salary AS (
SELECT * FROM dept_avg
WHERE average_dept > 25000
)

SELECT * FROM avg_salary;


SELECT id, name , salary,AVG(salary) OVER() AS avg_salary
FROM employee;

SELECT id,name,salary,AVG(salary) OVER(
PARTITION BY department
) AS department_avg_salary
FROM employee;


SELECT id , name, salary,ROW_NUMBER() OVER(
ORDER BY salary DESC
) AS rows_nums
FROM employee;
