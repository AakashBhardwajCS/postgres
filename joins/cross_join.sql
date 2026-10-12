-- 2: The CROSS JOIN (Merchandise Combinations)
-- The college is launching a merch store. We have a table of 3 shirt colors (Red, Blue, Black) and a table of 4 sizes (S, M, L, XL). We need to generate a list of every possible SKU combination to feed into our frontend dropdown menu.

select c.color, s.size
from merch_colors c
cross join merch_sizes s