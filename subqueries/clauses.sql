-- clauses for subqueries

-- Select, From, Where, Group By, Having, Order By, Limit, Offset

-- In Select (not recommended)

-- Fetch all employee details and add remarks to those employees who earn more than the average pay
-- we would need to case statement to check if the salary is greater than average salary and then add remarks accordingly
select *, (case when salary > (select avg(salary) from employees) then 'Above average' else 'Below average' end) as "remarks" from employees 

-- In Having

-- Find the stores who have sold more units than the average units sold by all stores.
select store_name, quantity from sales group by store_name

-- Find the stores who have sold more units than the average units sold by all stores.
select store_name, sum (quantity)
from sales
group by store_name
having sum(quantity) > (select avg(quantity) from sales)i;