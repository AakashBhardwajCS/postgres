-- Q1 Find stores who's sales where better than the average sales accross all stores

-- find total sales accross all stores
-- select avg(sales) from stores

select store_name, sum(price as "Total Sales") from sales group by store_name

-- now, average needs to be calculated on each store's total sales
