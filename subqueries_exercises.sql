show databases;
use employees;
select database();
show tables;
select * from employees;
select count(*) from employees;
select * from titles;
select * from dept_manager;
select * from departments;
select * from dept_emp;
select * from salaries;

-- 1
select * from employees 
join dept_emp on dept_emp.emp_no = employees.emp_no
where hire_date = (
select hire_date from employees 
where emp_no = 101010 
) and dept_emp.to_date = "9999-01-01";

-- 2
select title from titles
where emp_no in (select emp_no from employees 
where first_name = "Aamod" ) 
and to_date = "9999-01-01"
group by title
;
-- 3 
select count(*) as number_of_employees_no_longer_with_us from employees
where emp_no not in (
select emp_no from titles 
where to_date > curdate() -- 
)
; -- 59900

-- 4
select concat(first_name, " " ,last_name) as Name from employees
where emp_no in (select emp_no from dept_manager 
where emp_no in(select emp_no from employees where gender = 'F')
and to_date = "9999-01-01") 
; -- Isamu, Karsten, Leon, Hilary

-- 5
select * from employees
where emp_no in 
(select emp_no from salaries 
where salary > (select avg(salary) from salaries) 
and to_date = "9999-01-01");

-- 6
select std(salary) from salaries
where to_date > curdate();

select max(salary) - std(salary) from salaries where to_date > curdate();

select count(*) from salaries 
where salary > (select max(salary) - std(salary) from salaries where to_date > curdate())
and to_date > curdate();

select round(((select count(*) from salaries 
where salary > (select max(salary) - std(salary) from salaries where to_date > curdate())
and to_date > curdate()
)
/
(select count(*) from salaries s where s.to_date > curdate()))*100,2) as pctmaxstd 

