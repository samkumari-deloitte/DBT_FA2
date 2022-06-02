

with source_data as (
    SELECT c.code, f.category, c.starting_nav, d.nav ending_nav,c.year,((ending_nav - c.starting_nav)/c.starting_nav)*100 YTD_PERCENT 
    FROM (SELECT a.code, b.nav starting_nav, a.end_date, a.year 
        FROM (SELECT code, MIN(nav_date) start_date, MAX(nav_date) end_date, YEAR(nav_date) year 
                FROM nav_history GROUP BY code, YEAR(nav_date)) a, nav_history b 
                WHERE a.code = b.code AND a.start_date = b.nav_date) c, nav_history d, mutualfunds e, category f   
    WHERE c.code = d.code AND c.end_date = d.nav_date AND d.code = e.code AND e.category_id = f.id AND c.starting_nav <> 0 AND f.category LIKE '%Liquid%' ORDER BY CODE, c.year

)

select *
from source_data