show databases;
use employees;
select database();
SELECT * FROM titles;
SELECT * FROM employees;
SELECT DISTINCT title FROM titles; -- 2 7 can also do count(distinct title)
SELECT last_name FROM employees
WHERE last_name LIKE "e%e"
GROUP BY last_name; -- 3

SELECT first_name, last_name  FROM employees
WHERE first_name LIKE "e%e" and last_name Like "e%e"
GROUP BY first_name,last_name; -- 4

SELECT last_name FROM employees
WHERE last_name LIKE "%q%" and last_name NOT LIKE "%qu%"
Group BY last_name; -- 5 Chleq, Lindqvist, and Qiwen

SELECT last_name, COUNT(last_name) FROM employees
WHERE last_name LIKE "%q%" and last_name NOT LIKE "%qu%"
Group BY last_name; -- 6 or count(*)

SELECT first_name, gender, count(*)
FROM employees
WHERE first_name = 'Irena' or first_name =  'Vidya' or first_name =  'Maya' -- use in 
GROUP BY first_name, gender; -- 7

SELECT CONCAT(LOWER(SUBSTR(first_name, 1, 1)), lower(SUBSTR(last_name, 1, 4)),"_", SUBSTR(birth_date,6,2), SUBSTR(birth_date,3,2)) as username, COUNT(*)
FROM employees
GROUP BY username; -- 8

SELECT CONCAT(LOWER(SUBSTR(first_name, 1, 1)), lower(SUBSTR(last_name, 1, 4)),"_", SUBSTR(birth_date,6,2), SUBSTR(birth_date,3,2)) as username, COUNT(*) 
FROM employees
GROUP BY username 
HAVING count(*) > 1
ORDER BY count(*) DESC -- 9 6
 




