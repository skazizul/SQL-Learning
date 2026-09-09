CREATE DATABASE day3;
USE day3;
CREATE TABLE employee(
id INT,
name VARCHAR(50),
salary INT,
department VARCHAR(50)
);

INSERT INTO employee VALUES 
(1,"azizul",20000,"IT"),
(2,"azizul1",20002,"HR"),
(3,"azizul2",20004,"HR"),
(4,"azizul3",20006,"IT"),
(5,"azizul4",20008,"marketing");


SELECT* FROM employee;


SELECT department,COUNT(*)
FROM employee
GROUP BY department;


SELECT department,AVG(salary),SUM(salary),MAX(salary),MIN(salary)
FROM employee
GROUP BY department;

SELECT department , AVG(salary)
FROM employee
GROUP BY department
HAVING AVG(salary) > 20000 AND AVG(salary) < 20005;
