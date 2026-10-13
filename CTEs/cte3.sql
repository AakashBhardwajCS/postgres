-- 3: The Multi-Step Pipeline (Multiple CTEs)
-- We only want to look at active students, and we only want to look at premium courses. Then, we join them together.

with active_students as (
    select id, name
    from users
    where role = 'student' and is_active = TRUE
),
premium_courses as (
    select, id, name
    from courses
    where fee>=4000
)
select a.name as "Student name", p.name as "Premium Course"
from enrollments e
inner join active_students a on e.user_id = a.id
inner join premium_courses p on e.course_id = p.id;