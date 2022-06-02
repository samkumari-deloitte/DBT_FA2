

      create or replace transient table analytics.dbt.abc  as
      (

with source_data as (

    select * from analytics.dbt2.Users

)

select *
from source_data
      );
    