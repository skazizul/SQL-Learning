CREATE DATABASE day9;
USE day9;
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

SELECT id ,LPAD(id,5,0)
FROM employee;

SELECT id,RPAD(id,5,0)
FROM employee;

SELECT name , REVERSE(name)
AS reverse_name
FROM employee;

SELECT name,INSERT(name,2,3,'XX')
AS new_string
FROM employee;

SELECT id,name,FORMAT(salary,2)
AS format_salary
FROM employee;

SELECT name,ASCII(name)
AS ascii_value
FROM employee;

SELECT CHAR(72,105);

SELECT name,POSITION('z' IN name)
AS starting_position
FROM employee;

CREATE TABLE salary_log(
id INT AUTO_INCREMENT PRIMARY KEY,
empId INT,
oldsalary INT,
newsalary INT
);

DELIMITER //
CREATE TRIGGER update_salary_log
AFTER UPDATE ON employee
FOR EACH ROW
BEGIN
INSERT INTO salary_log(empId,oldsalary,newsalary)
VALUES(OLD.id,OLD.salary,NEW.salary);
END //
DELIMITER ;

UPDATE employee
SET salary = 21000
WHERE id = 8;
SELECT * FROM salary_log;


DELIMITER//
CREATE TRIGGER before_salary
BEFORE INSERT ON employee
FOR EACH ROW
BEGIN:
IF NEW.salary < 0 THEN
NEW.salary = 0
END IF
END //
DELIMITER ;

INSERT INTO employee
VALUES(10,'aziz10',-12300,'	IT');

SELECT * FROM employee;