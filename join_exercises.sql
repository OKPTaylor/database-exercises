use join_example_db;
select database();
show tables;

select * from roles;
select * from users;

select * from roles
join users on roles.id = users.role_id;

select * from roles
left join users on roles.id = users.role_id;

select * from roles
right join users on roles.id = users.role_id;

select roles.name as role_name,
count(users.name) as number_of_employees
from users
right join roles on users.role_id = roles.id
group by role_name;

use employees;
select database();
show tables;
select * from departments;
select * from dept_manager;
select * from employees;
select * from salaries;
select * from dept_emp;
select * from titles;

-- 2
select departments.dept_name, concat(employees.first_name, " ",employees.last_name) as Department_Manager 
from departments
join dept_manager on departments.dept_no = dept_manager.dept_no
join employees on dept_manager.emp_no = employees.emp_no -- forget you can use "as"
where to_date = "9999-01-01" -- can also use .to_date > curdate()
order by departments.dept_name 
;

-- 3
select departments.dept_name, concat(employees.first_name," ",employees.last_name) as Manager_Name 
from departments
join dept_manager on departments.dept_no = dept_manager.dept_no
join employees on dept_manager.emp_no = employees.emp_no
where to_date = "9999-01-01" and gender = 'F'
order by departments.dept_name 
;



-- 4
select title, count(*) as Count
from titles
join employees on titles.emp_no = employees.emp_no
join dept_emp on employees.emp_no = dept_emp.emp_no
join departments on dept_emp.dept_no = departments.dept_no
where titles.to_date = "9999-01-01" and departments.dept_name = "Customer Service"
group by title
order by title
; 

-- 5
select departments.dept_name, concat(employees.first_name, " " ,employees.last_name) as name,  salaries.salary
from departments
join dept_manager on departments.dept_no = dept_manager.dept_no
join employees on dept_manager.emp_no = employees.emp_no
join salaries on employees.emp_no = salaries.emp_no
where salaries.to_date = "9999-01-01" and dept_manager.to_date = "9999-01-01"
group by departments.dept_name, salaries.salary, employees.first_name, employees.last_name
order by departments.dept_name 
; 

-- 6
select dept_emp.dept_no, departments.dept_name, count(emp_no) as num_employees
from dept_emp
join departments on dept_emp.dept_no = departments.dept_no
where dept_emp.to_date = "9999-01-01" 
group by dept_emp.dept_no, departments.dept_name
order by dept_emp.dept_no
; 

-- 7
select departments.dept_name, round(avg(salary),2) as average_salary
from departments
join dept_emp on departments.dept_no = dept_emp.dept_no
join salaries on dept_emp.emp_no = salaries.emp_no
where salaries.to_date = "9999-01-01" and dept_emp.to_date = "9999-01-01"
group by departments.dept_name
order by departments.dept_name desc
limit 1
; 

-- 8
select employees.first_name, employees.last_name
from departments
join dept_emp on departments.dept_no = dept_emp.dept_no
join employees on dept_emp.emp_no = employees.emp_no
join salaries on employees.emp_no = salaries.emp_no
where salaries.to_date = "9999-01-01" and dept_emp.to_date = "9999-01-01" and departments.dept_name = "Marketing"
group by employees.first_name, employees.last_name, salaries.salary
order by salary desc
limit 1
; 

-- 9
select employees.first_name, employees.last_name, max(salary) as salary, departments.dept_name
from departments
join dept_manager on departments.dept_no = dept_manager.dept_no
join employees on dept_manager.emp_no = employees.emp_no
join salaries on employees.emp_no = salaries.emp_no
where salaries.to_date = "9999-01-01" and dept_manager.to_date = "9999-01-01"
group by employees.first_name, employees.last_name, departments.dept_name
order by max(salary) desc
limit 1
; 

-- 10 
select departments.dept_name, round(avg(salary),0) as average_salary
from departments
join dept_emp on departments.dept_no = dept_emp.dept_no
join salaries on dept_emp.emp_no = salaries.emp_no
group by departments.dept_name
order by average_salary desc 
;

select concat(employees.first_name, ' ' ,employees.last_name) as employee_name, departments.dept_name
from departments
join dept_emp on departments.dept_no = dept_emp.dept_no
join employees on dept_emp.emp_no = employees.emp_no
join dept_manager on departments.dept_no = dept_manager.dept_no
where dept_emp.to_date = "9999-01-01"
group by departments.dept_name, employee_name
order by departments.dept_name
; -- 11

select concat(employees.first_name, ' ' ,employees.last_name) as employee_name, departments.dept_name, salaries.salary
from departments
join dept_emp on departments.dept_no = dept_emp.dept_no
join employees on dept_emp.emp_no = employees.emp_no
join dept_manager on departments.dept_no = dept_manager.dept_no
join salaries on employees.emp_no = salaries.emp_no
where dept_emp.to_date = "9999-01-01"
group by departments.dept_name, employee_name, salaries.salary
order by salaries.salary
; -- 12




