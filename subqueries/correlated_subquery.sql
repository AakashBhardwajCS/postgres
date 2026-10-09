-- Subquery which is related or dependent on the outer query is called correlated subquery.
--  It is executed once for each row selected by the outer query.

--  Q1 Find employees in each department who earn more than the average salary in that department

-- Checking the average salary of each department

select department, avg(salary) from employee group by departemnt

-- After this we ncan use joins to solve this but we will use correlated subquery

-- solving using correlated subquery, we would need department in the subquery from the outer query

-- This some department will be each department that is being processed by the outer query
select * from employees where salary > (select avg(salary) from employees where department = 'some department')

-- Final query
select * from employees e1 where salary > (select avg(salary) from employees e2 where department = e1.department)

-- Problem - If outer query has 1000 rows, then the inner query will be executed 1000 times. This is not efficient. We can use joins to solve this problem.

--  Q1 Find departments with no employees
-- checking for each department if employees exist in that department, if not then we will select that department
select * from departments d where not exists (select * from employees el where el.department = d.department)