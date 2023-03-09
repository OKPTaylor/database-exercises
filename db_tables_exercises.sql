SHOW DATABASES;
USE albums_db;
SELECT DATABASE();
SHOW TABLES;
USE employees;
SELECT DATABASE();
SHOW TABLES;
SELECT * FROM employees; -- show create table will show you data types
-- Which table(s) do you think contain a numeric type column?all of them for the primary key
-- Which table(s) do you think contain a string type column? all of them for names 
-- Which table(s) do you think contain a date type column? employees
-- What is the relationship between the employees and the departments tables? They are in the same database and share dep no
SELECT * FROM departments;
SHOW CREATE TABLE dept_manager;
SHOW CREATE TABLE departments;
show create table employees; 
SELECT * FROM dept_manager;


