-- Find the employees who earn the highest salary in each department.
select dept_name, max(salary) from employees group by dept_name

-- To select all columns (the users having the highest salaries), we can use multiple row subquery here:
select * from employees where dept_name, salary in (select dept_name, max(salary) from employees group by dept_name)