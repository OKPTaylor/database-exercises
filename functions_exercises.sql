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
WHERE birth_date LIKE "%12-25"
LIMIT 3; -- 9
SELECT * FROM employees 
WHERE birth_date LIKE "%12-25" AND hire_date LIKE "199%"
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
WHERE birth_date LIKE "%12-25" AND hire_date LIKE "199%"
ORDER BY birth_date, hire_date DESC; -- 7 362 returned Amestein Undy and Poornachandra Wilharm
-- 1
SELECT DISTINCT first_name, last_name, CONCAT(first_name, " ", last_name) as full_name  FROM employees
WHERE last_name LIKE "%E" and last_name LIKE "E%"; -- 2
SELECT DISTINCT first_name, last_name, hire_date, CONCAT(UPPER(first_name), " ", UPPER(last_name)) as full_name  FROM employees
WHERE last_name LIKE "%E" and last_name LIKE "E%"; -- 3
SELECT DISTINCT COUNT(*) FROM employees
WHERE last_name LIKE "%E" and last_name LIKE "E%"; -- 4
SELECT CONCAT(UPPER(first_name), " ", UPPER(last_name)), hire_date, birth_date, Datediff(curdate(), hire_date) AS number_of_days_employed FROM employees 
WHERE birth_date LIKE "%12-25" AND hire_date LIKE "199%"; -- 5
SELECT * FROM salaries;
SELECT MAX(salary), MIN(salary) FROM salaries
WHERE to_date > now(); -- 6
SELECT CONCAT(LOWER(SUBSTR(first_name, 1, 1)), lower(SUBSTR(last_name, 1, 4)),"_", SUBSTR(birth_date,6,2), SUBSTR(birth_date,3,2)) as username, first_name, last_name, birth_date 
FROM employees; -- 7 can do left(first_name, 1) can also do date_format(birthday, '%m%y')





