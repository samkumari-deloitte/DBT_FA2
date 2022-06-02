



{{ config(materialized='table') }}

with source_data as (

    SELECT c.code, c.starting_nav, d.nav ending_nav,c.year,((ending_nav - c.starting_nav)/c.starting_nav)*100 YTD_PERCENT 
    FROM (SELECT a.code, b.nav starting_nav, a.end_date, a.year 
        FROM (SELECT code, MIN(nav_date) start_date, MAX(nav_date) end_date, YEAR(nav_date) year 
                FROM nav_history GROUP BY code, YEAR(nav_date)) a, nav_history b 
        WHERE a.code = b.code AND a.start_date = b.nav_date) c, nav_history d 
    WHERE c.code = d.code AND c.end_date = d.nav_date AND c.starting_nav <> 0 ORDER BY CODE, c.year
)

select *
from source_data
