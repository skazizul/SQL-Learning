CREATE DATABASE day7;
USE day7;

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

SELECT id,name,salary ,ROW_NUMBER() OVER(
ORDER BY salary DESC
) AS row_numbers
FROM employee;

SELECT id,name,salary,LAG(salary) OVER(
ORDER BY id DESC
)AS prev_salary
FROM employee;

SELECT id,name,salary,LAG(salary) OVER(
ORDER BY id ASC
) AS prevoius_salary,
salary - LAG(salary) OVER(
ORDER BY id ASC
)AS diff_salary
FROM employee;

SELECT id,name,salary,LEAD(salary) OVER(
ORDER BY id
)AS next_salary
FROM employee;


SELECT id,name,salary,LEAD(salary) OVER(
ORDER BY id
)AS next_salary,
LEAD(salary) OVER(
ORDER BY id
) - salary AS diff_salary
FROM employee;