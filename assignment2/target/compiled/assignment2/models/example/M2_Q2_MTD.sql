

with source_data as (

    SELECT c.code, c.starting_nav, d.nav ending_nav,c.month,((ending_nav - c.starting_nav)/c.starting_nav)*100 MTD_PERCENT
    FROM (SELECT a.code, b.nav starting_nav, a.end_date, a.month 
        FROM (SELECT code, MIN(nav_date) start_date, MAX(nav_date) end_date, MONTH(nav_date) month 
                FROM nav_history GROUP BY code, MONTH(nav_date)) a, nav_history b 
        WHERE a.code = b.code AND a.start_date = b.nav_date) c, nav_history d
    WHERE c.code = d.code AND c.end_date = d.nav_date AND c.starting_nav <> 0 AND c.code IN (100033, 100034, 100037) ORDER BY CODE, c.month
)

select *
from source_data