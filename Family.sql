CREATE DATABASE family_income;
USE family_income;
CREATE TABLE members(
id INT,
name VARCHAR(50),
salary INT
);

INSERT INTO members VALUES
(1,"SK ASFAR ALI",40000),
(2,"HASINA BEGUM",10000),
(3,"SK HASIBUL HOSSAIN",35000),
(4,"AYESHA SULTANA",10000),
(5,"SK AZIZUL HOSEN",20000);

SELECT * FROM family_income.members;


SELECT * 
FROM family_income.members
WHERE salary >= 20000;

SELECT* FROM family_income.members
ORDER BY salary DESC;

SELECT* FROM family_income.members
ORDER BY salary ASC
LIMIT 3;

INSERT INTO members VALUES
(6,"SK ALI HOSEN",25000);

UPDATE family_income.members
SET salary = 60000
WHERE id = 3;

SELECT* FROM members
WHERE id = 3;

DESCRIBE family_income.members;
ALTER TABLE family_income.members
ADD PRIMARY KEY (id);


INSERT INTO family_income.members VALUES
(7,"Neha",NULL),
(8,"Josim",NULL);


SELECT * FROM members
WHERE salary is NULL;


SELECT * FROM members
WHERE salary is NOT NULL;


SELECT name,salary FROM members
WHERE salary is NOT NULL;


SELECT * FROM members
WHERE name LIKE "S%";

SELECT * FROM members
WHERE name LIKE "%S%";


SELECT* FROM members
WHERE name LIKE "S%" AND name LIKE "%N";


SELECT* FROM members
WHERE name LIKE "_k%";








CREATE TABLE employeedetails(
id INT,
name VARCHAR(50),
salary INT
);

INSERT INTO employeedetails VALUES
(1,"aziz",2000),
(2,"jebon",40000);

ALTER TABLE employeedetails
ADD PRIMARY KEY (id);

UPDATE employeedetails
SET salary = 20000
WHERE id = 1;


SELECT* FROM employeedetails
WHERE id IN(1,2);

SELECT* FROM employeedetails
WHERE salary BETWEEN 15000 AND 45000;


SELECT COUNT(*)
FROM employeedetails;

SELECT SUM(salary)
FROM employeedetails;


SELECT AVG(salary)
FROM employeedetails;

SELECT MAX(salary)
FROM employeedetails;

SELECT MIN(salary)
FROM employeedetails;


SELECT COUNT(*), SUM(salary), AVG(salary), MAX(salary), MIN(salary)
FROM employeedetails;


