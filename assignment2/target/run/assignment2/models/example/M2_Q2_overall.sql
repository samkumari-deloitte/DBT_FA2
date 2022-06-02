

      create or replace transient table analytics.dbt.M2_Q2_overall  as
      (

with source_data as (
    SELECT c.code, c.starting_nav, d.nav ending_nav,((ending_nav - c.starting_nav)/c.starting_nav)*100 OVERALL_PERCENT 
    FROM (SELECT a.code, b.nav starting_nav, a.end_date 
        FROM (SELECT code, MIN(nav_date) start_date, MAX(nav_date) end_date 
                FROM nav_history GROUP BY code) a, nav_history b 
        WHERE a.code = b.code AND a.start_date = b.nav_date) c, nav_history d 
    WHERE c.code = d.code AND c.end_date = d.nav_date AND c.starting_nav <> 0 AND c.code IN (100033, 100034, 100037) ORDER BY CODE
)

select *
from source_data
      );
    