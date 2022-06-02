

with source_data as (
    SELECT b.name best_performing_fund, SUM(sale_price) sum_price
    FROM nav_history a, mutualfunds b, category c 
    WHERE a.code = b.code AND b.category_id = c.id  AND c.category LIKE '%Liquid%' 
    GROUP BY  b.name 
    ORDER BY sum_price DESC LIMIT 1
)

select *
from source_data