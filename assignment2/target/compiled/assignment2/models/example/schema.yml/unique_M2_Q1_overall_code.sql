
    
    

select
    code as unique_field,
    count(*) as n_records

from analytics.dbt.M2_Q1_overall
where code is not null
group by code
having count(*) > 1


