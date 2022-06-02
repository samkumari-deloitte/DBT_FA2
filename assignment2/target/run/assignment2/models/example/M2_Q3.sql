

      create or replace transient table analytics.dbt.M2_Q3  as
      (

with source_data as (
    SELECT m.code,m.name Discontinued_Fund, last_present_year 
    FROM (SELECT a.code, b.max_date, YEAR(b.max_date) last_present_year  
        FROM nav_history a, (SELECT code, MAX(nav_date) max_date 
                            FROM nav_history GROUP BY code) b
        WHERE a.code = b.code and a.nav_date = b.max_date) n, mutualfunds m 
    WHERE n.code = m.code AND last_present_year = 2018
)

select *
from source_data
      );
    