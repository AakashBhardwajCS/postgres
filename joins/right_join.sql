-- 4: The RIGHT JOIN (All Departments, with or without Students)
-- The administration wants a list of ALL departments along with the students in them.
-- Departments which do not have any users assigned yet should still show up, with the student as NULL.

-- RIGHT JOIN returns every row from the right table (departments) and the matching rows from the left table (users)
-- It is the mirror of LEFT JOIN. "users u right join departments d" is the same as "departments d left join users u"
select u.name as "Student Name", d.name as "Department Name"
from users u
right join departments d
on u.department_id = d.id


-- Find the departments that do not have any students yet
-- Keep only the rows where the left side (users) did not match
select d.name
from users u
right join departments d
on u.department_id = d.id
where u.id is null


-- How many students are there in each department? Departments with no students should show 0.
-- count(u.id) ignores NULL values, so empty departments get 0 (count(*) would wrongly give 1)
select d.name as "Department", count(u.id) as "Total Students"
from users u
right join departments d
on u.department_id = d.id
group by d.name
