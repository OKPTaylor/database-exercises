USE employees;
SELECT DATABASE();
SHOW TABLES;
SELECT * FROM employees;
SELECT * FROM employees
WHERE first_name IN ('Irena', "Vidya", 'Maya')
LIMIT 3; -- 1
SELECT * FROM employees
WHERE first_name = 'Irena'
OR first_name = 'Vidya'
OR first_name = 'Maya'
LIMIT 3; -- 2 yes
SELECT * FROM employees
WHERE gender = 'm' AND
(first_name = 'Irena'
OR first_name = 'Vidya'
OR first_name = 'Maya')
LIMIT 3; -- 3
SELECT DISTINCT last_name FROM employees
WHERE last_name LIKE "E%"; -- 4
SELECT DISTINCT last_name FROM employees
WHERE last_name LIKE "E%" or last_name LIKE "%E"; -- 5
SELECT DISTINCT last_name FROM employees
WHERE last_name LIKE "%E" and last_name NOT LIKE "E%"; -- 6
SELECT DISTINCT last_name FROM employees
WHERE last_name LIKE "%E" and last_name LIKE "E%"; -- 7
SELECT * FROM employees 
WHERE hire_date LIKE "199%"
LIMIT 3; -- 8
SELECT * FROM employees 
WHERE birth_date LIKE "%-25"
LIMIT 3; -- 9
SELECT * FROM employees 
WHERE birth_date LIKE "%-25" AND hire_date LIKE "199%"
LIMIT 3; -- 10
SELECT DISTINCT last_name FROM employees
WHERE last_name LIKE "%q%"; -- 11
SELECT DISTINCT last_name FROM employees
WHERE last_name LIKE "%q%" and last_name NOT LIKE "%qu%"; -- 12






