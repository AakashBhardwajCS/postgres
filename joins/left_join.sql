-- 3: The LEFT JOIN (All Students, with or without a Department)
-- The administration wants a list of ALL users. If a user belongs to a department, show the department name.
-- If a user does not have a department yet (like new students), still show them, with the department as NULL.

-- LEFT JOIN returns every row from the left table (users) and the matching rows from the right table (departments)
-- If there is no match, the columns from the right table come back as NULL
select u.name as "Student Name", d.name as "Department Name"
from users u
left join departments d
on u.department_id = d.id


-- Find the students who do not have a department yet
-- We take the LEFT JOIN result and keep only the rows where the right side did not match (NULL)
select u.name
from users u
left join departments d
on u.department_id = d.id
where d.id is null


-- Show every student and how much they have paid in total. Students who never paid should show 0.
-- sum() would return NULL for students with no payments, so we use coalesce() to turn NULL into 0
select u.name, coalesce(sum(p.amount), 0) as "Total Paid"
from users u
left join payments p
on u.id = p.user_id
group by u.name
