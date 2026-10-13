-- 2: The "Virtual Table" (Aggregating before Joining)
-- We want a list of students and the total amount of money they have spent. But we want to calculate the math before we join the tables to keep things fast and clean.

-- Normal query

select u.name, sum(p.amount) as total_spent
from users u
inner join payments p on u.id = p.user_id
where p.status = 'completed'
group by u.id, u.name;

-- CTE

with total_spent as (
    select p.user_id, sum(p.amount) as total
    from payments p
    wehre p.status = 'completed'
    group by p.user_id
)
select u.id, u.name, u.total
from users u
inner join total_spent ts on u.id = ts.user_id;