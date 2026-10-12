-- 1: The INNER JOIN (Students with a Department)
-- The college administration wants a list of all users along with the name of the department they belong to.
-- We only want users who actually have a department assigned. Users without a department (and departments without users) should be left out.

-- INNER JOIN only returns rows where there is a match in BOTH tables
-- Since both tables have a "name" column, we give aliases so the result is not confusing
select u.name as "Student Name", d.name as "Department Name"
from users u
inner join departments d
on u.department_id = d.id


-- Which students have made a completed payment and how much did they pay?
-- Students who never paid will not show up because there is no matching row in payments
select u.name, p.amount
from users u
inner join payments p
on u.id = p.user_id
where p.status = 'completed'


-- How much money has each department collected? (INNER JOIN + GROUP BY)
-- We can chain multiple joins: users -> departments and users -> payments
select d.name as "Department", sum(p.amount) as "Total Collected"
from users u
inner join departments d
on u.department_id = d.id
inner join payments p
on u.id = p.user_id
where p.status = 'completed'
group by d.name
