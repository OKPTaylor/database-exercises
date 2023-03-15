show databases;
use employees;
select database();
show tables;
select * from departments;
select * from employees;
select * from dept_emp;
select * from salaries;
select birth_date from employees 
where substr(birth_date,3,4) like "6%";


-- 1
select employees.emp_no, hire_date, to_date,
if(to_date = "9999-01-01", true, false) as is_currently_employee from departments
join dept_emp on departments.dept_no = dept_emp.dept_no
join employees on dept_emp.emp_no = employees.emp_no;

-- 2 
select concat(first_name, " ", last_name) as employee_name, 
case 
when last_name like "a%" then "A-H"
when last_name like "b%" then "A-H"
when last_name like "c%" then "A-H"
when last_name like "d%" then "A-H"
when last_name like "f%" then "A-H"
when last_name like "g%" then "A-H"
when last_name like "h%" then "A-H" -- use whe left(last_name,1) <="H" then "A-H"
when last_name like "i%" then "I-Q" 
when last_name like "j%" then "I-Q"
when last_name like "k%" then "I-Q"
when last_name like "l%" then "I-Q"
when last_name like "m%" then "I-Q"
when last_name like "o%" then "I-Q"
when last_name like "p%" then "I-Q"
when last_name like "q%" then "I-Q" -- use when left(last_name,1) <= "q" then "I-Q"
else "R-Z"
end as alpha_group 

 from employees;
 
 -- 3
select decade, count(*) as number_by_decade -- use a min and max query to find out the min and max dates before starting
from  
(select birth_date,
case 
when substr(birth_date,3,4) like "5%" then "The 50's"
when substr(birth_date,3,4) like "6%" then "The 60's"
when substr(birth_date,3,4) like "7%" then "The 70's"
when substr(birth_date,3,4) like "8%" then "The 80's"
else "the 90's"
end as decade 
from employees) as decade_group 
group by decade
; -- no subquery needed, why did I do that?


-- 4
select -- dept_group is selected
case
when dept_name in ('research','development') then 'R&D'
when dept_name in ('sales', "marketing") then "Sales & Marketing"
when dept_name in ('finance', "human resources") then "Finance & HR"
else dept_name
end as dept_group ,
avg(salary)
from departments
join dept_emp on departments.dept_no = dept_emp.dept_no
join salaries on dept_emp.emp_no = salaries.emp_no
where salaries.to_date > now()
group by dept_group
;

