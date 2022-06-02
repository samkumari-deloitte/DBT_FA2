

      create or replace transient table analytics.dbt.Q1_M1  as
      (

with source_data as (

    select date_part(month,nav_date) as month_number, AVG(nav), AVG(repurchase_price),AVG(sale_price) from nav_history GROUP BY date_part(month,nav_date)
)

select *
from source_data
      );
    