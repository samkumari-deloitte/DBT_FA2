
  create or replace  view analytics.dbt.my_second_dbt_model
  
   as (
    -- Use the `ref` function to select from other models

select *
from analytics.dbt.abc
where "Id" = 1
  );
