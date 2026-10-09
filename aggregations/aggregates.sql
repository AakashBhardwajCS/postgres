-- The administration needs to know exactly how many active students are currently enrolled in the college.

-- Here count wil ignore null values of is_active. 
-- We are providing an alias name to the count (always give the column alias in "" as '' are for values)
-- Can also give without double quotes but then no spaces would be allowed
-- An alias gives a temporary name to a column or table in your query result.
-- If we were doing count(*) we would get count=value as result but we can assign alias to make it look cleaner
-- Using is_active directly. use <table>.<column> when joining two tables 
-- SELECT users.id, orders.id FROM users JOIN orders ON users.id = orders.user_id;
select count(is_active) as "Total Active Students" from users where is_active = TRUE;


-- How much money has college officially collected

select sum(amount) as "Total Money Collected" from payments where status = 'completed';

-- What is the average price of premium courses

-- This would return a vlue like this -> 3514.87500000000. Need to round this off. For this we use ROUND()
-- This will now round off to 2 decimal places
select round(avg(fee), 2) "Average Fees" from courses

-- Minimum fee course

select min(fee) as "Minimum Fees" from courses
-- But if we want to select title here, pg will throw the error:
-- ERROR: column "courses. title" must appear in the GROUP BY clause or be used in an aggregate function LINE 1: select min(fee), title

