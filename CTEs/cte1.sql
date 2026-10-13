-- 1: Refactoring the Subquery (Readability Win)
-- We found courses that cost more than the average fee using a subquery in the WHERE clause. Let's rewrite it
-- using a CTE. It makes the code instantly self-documenting!

-- Here the inner query runs first
SELECT title, fee
FROM courses
WHERE fee > (SELECT AVG (fee) FROM courses);
SELECT AVG (fee) FROM courses

-- CTE
with average_fee as (
    select avg(fee) as avg_fee from courses
)
select title, fee from courses where fee > (select avg_fee from average_fee)

-- Biggest advantage of CTE
