show databases;
use pagel_2188;
use employees;
use sakila;
select database();
select database();
show tables;
select * from departments;
select * from dept_emp;
select * from employees;
select * from salaries;
show create table employees;
select * from payment;



select * from pagel_2188.employees_with_departments;
-- 1
create temporary table pagel_2188.employees_with_departments 
(
select employees.first_name, employees.last_name, dept_name 
from departments
join dept_emp on departments.dept_no = dept_emp.dept_no
join employees on dept_emp.emp_no = employees.emp_no
where to_date > curdate()
)
;

alter table pagel_2188.employees_with_departments 
add full_name varchar(30)
;

update pagel_2188.employees_with_departments
set full_name = concat(first_name, ' ' ,last_name)
;

drop table pagel_2188.employees_with_departments; -- just to drop the table if I need to re-do something
alter table pagel_2188.employees_with_departments drop column first_name;
alter table pagel_2188.employees_with_departments drop column last_name;

-- could have run the query with full_name from the start by concat

-- 2
create temporary table pagel_2188.payment_in_cents
(
select payment_id, customer_id, staff_id, rental_id, round(amount*100,0) as payment_in_cents, payment_date, last_update
from payment
)
;

select * from pagel_2188.payment_in_cents; -- can also alter table to int from float to drop the .00
drop table pagel_2188.payment_in_cents; -- just incase I need to re-do something

-- 3 
create temporary table pagel_2188.z_score_scraps
(
SELECT d.dept_name, ROUND(AVG(s.salary),0) AS avg_dept_salary
FROM departments d
JOIN dept_emp de ON d.dept_no = de.dept_no
join employees e on de.emp_no = e.emp_no
JOIN salaries s ON e.emp_no = s.emp_no
where s.to_date > now() and d.to_date > now()
GROUP BY d.dept_name
)
;
select * from pagel_2188.z_score_scraps;

create temporary table pagel_2188.salary_aggro
(
select avg(salary), std(salary) 
from salaries
)
;

select * from pagel_2188.salary_aggro;

create temporary table pagel_2188.z_score_final
(
 SELECT salary,
        (salary - (SELECT AVG(salary) FROM salaries where to_date > now()))
        /
        (SELECT stddev(salary) FROM salaries where to_date > now()) AS zscore
    FROM salaries
    WHERE to_date > now()
)
;

select * from pagel_2188.z_score_scraps;

