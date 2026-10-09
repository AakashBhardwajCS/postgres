-- Q1 Find employees who earn more than the average salary of all employees
-- scalar subquery is a subquery that returns a single value. It can be used in the select, where, having clause of the outer query.
select *
from employee
where salary > (select avg(salary) from employee); -- subquery/ inner query