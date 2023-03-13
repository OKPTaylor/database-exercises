show databases;
use employees;
select database();
show tables;
select * from employees;
select * from salaries;
select * from dept_emp;
select emp_no, round(avg(salary),2) from salaries  
group by emp_no; -- shows the historic avg for each employee's salary rounded to 2 decimal places 

select dept_no, count(*) from dept_emp
where to_date = "9999-01-01"
group by dept_no; -- shows the current employee count for each deptarment 

select emp_no, count(salary) from salaries
group by emp_no; -- this counts each employee's total number of salaries 

select emp_no, salary from salaries
group by emp_no, salary; -- this will group emp_no and salary with each pairing being unique 

select emp_no, max(salary) from salaries
group by emp_no; -- shows maximum salary for each employee 

select emp_no, min(salary) from salaries
group by emp_no; -- shows minimum salary for each employee alter

select emp_no, round(std(salary),2) as standard_deviation from salaries
group by emp_no; -- shows std fro each employee rounded to 2 decimal places with the row renamed 

select emp_no, max(salary) from salaries
where salary > 150000
group by emp_no; -- shows the max salary for each employee where the max is over 150000

select emp_no, max(salary) from salaries 
group by emp_no
having max(salary) > 150000; -- shows the max salary for each employee where the max is over 150000

select emp_no, round(avg(salary),2) from salaries 
group by emp_no
having avg(salary) > 80000 and avg(salary) < 90000; -- shows the avg salary of each employee if it is between 80k and 90k rounded because its money




