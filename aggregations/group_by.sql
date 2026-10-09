-- for selecting title, we need to group the rows by the aggregator

select title, min(fee) as "Minimum Fees" from courses group by title

-- Q1 total sales by department

-- Tip - If the column appears after select and is not wrapped in an aggregator function
-- It needs to be present after group by
select department, sum(sales) from orders group by department

-- Q2 Department with sales higher than 100000

select department, SUM(sales) as total_sales from orders group by department having total_sales > 100000

-- Q3 How many admins, professors and students do we have in our college?

-- here * will count all the rows in the groups regardless of any column being null
select role, count(*) as 'Total Count' from users where is_active = TRUE group by role

-- Q4 How much money is successfully completed versus pending or failed

select status, sum(amoount) as "Total Amount" from payments group by status

-- Q5Which department has high volume of users

select department_id, max(id) as "Total Users" from users group by department_id order by "Total Users" desc limit 1