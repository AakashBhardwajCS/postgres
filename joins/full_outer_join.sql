-- Let's say the college administration wants a complete reconciliation report of Users and Departments. We want to see:
-- Users who belong to a department.
-- Users who do not have a department yet (like new students).
-- Departments that do not have any users assigned to them yet.

select u.name, d.name
from users u
full outer join departments d
on u.department_id = d.id



