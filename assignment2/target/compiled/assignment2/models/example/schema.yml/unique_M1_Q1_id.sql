
    
    

select
    id as unique_field,
    count(*) as n_records

from analytics.dbt.M1_Q1
where id is not null
group by id
having count(*) > 1


