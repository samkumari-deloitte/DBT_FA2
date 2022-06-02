

      create or replace transient table analytics.dbt.M1_Q2  as
      (

with source_data as (

    SELECT code, MAX(nav) maximum_nav, MIN(nav) minimum_nav FROM nav_history GROUP BY code 
)

select *
from source_data
      );
    