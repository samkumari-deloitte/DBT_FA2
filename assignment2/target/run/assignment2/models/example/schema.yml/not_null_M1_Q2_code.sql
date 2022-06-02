select
      count(*) as failures,
      count(*) != 0 as should_warn,
      count(*) != 0 as should_error
    from (
      
    
    



select code
from analytics.dbt.M1_Q2
where code is null



      
    ) dbt_internal_test