CREATE DATABASE day10;
USE day10;

CREATE TABLE student_course (
    student_id INT,
    course_id INT,
    student_name VARCHAR(50),
    course_name VARCHAR(50),
    marks INT,
    PRIMARY KEY (student_id, course_id)
);

INSERT INTO student_course
(student_id, course_id, student_name, course_name, marks)
VALUES
(1, 101, 'Rahul', 'SQL', 80),
(1, 102, 'Rahul', 'Java', 75),
(2, 101, 'Priya', 'SQL', 90);

SELECT * FROM student_course;

CREATE TABLE student (
    student_id INT PRIMARY KEY,
    student_name VARCHAR(50),
    department_id INT
);

INSERT INTO student
(student_id, student_name, department_id)
VALUES
(1, 'Rahul', 10),
(2, 'Priya', 20),
(3, 'Amit', 10);

CREATE TABLE department_new (
    department_id INT PRIMARY KEY,
    department_name VARCHAR(50)
);

INSERT INTO department_new
(department_id, department_name)
VALUES
(10, 'CSE'),
(20, 'ECE');

ALTER TABLE student
ADD CONSTRAINT fk_student_department
FOREIGN KEY (department_id)
REFERENCES department_new(department_id);

SELECT * FROM student;
EXPLAIN
SELECT *
FROM student
WHERE department = 'CSE';