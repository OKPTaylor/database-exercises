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
-- 1
USE employees; 
SELECT DATABASE();
SHOW TABLES;
SELECT * FROM employees;
SELECT first_name, last_name FROM employees
WHERE first_name = "Irena" or first_name = "Vidya" or first_name = "Maya"
ORDER BY first_name; -- 2 Irena Reutenauer and Vidya Simmen
SELECT first_name, last_name FROM employees
WHERE first_name = "Irena" or first_name = "Vidya" or first_name = "Maya"
ORDER BY first_name, last_name ; -- 3 Irena Action and Vidya Zweizig
SELECT first_name, last_name FROM employees
WHERE first_name = "Irena" or first_name = "Vidya" or first_name = "Maya"
ORDER BY last_name, first_name; -- 4 Irena Action and Maya Zyda
SELECT DISTINCT first_name, last_name, emp_no FROM employees
WHERE last_name LIKE "%E" and last_name LIKE "E%"
ORDER BY emp_no; -- 5 899, #10021 Ramzi Erdie and #499648 Tadahiro Erde
SELECT DISTINCT first_name, last_name, hire_date FROM employees
WHERE last_name LIKE "%E" and last_name LIKE "E%"
ORDER BY hire_date DESC; -- 6 899 Teiji Eldridge and Sergi Erde
SELECT * FROM employees 
WHERE birth_date LIKE "%-25" AND hire_date LIKE "199%"
ORDER BY birth_date, hire_date DESC; -- 7 4480 returned Amestein Undy and Poornachandra Wilharm



