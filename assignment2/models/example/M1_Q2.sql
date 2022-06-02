{{ config(materialized='table') }}

with source_data as (

    SELECT code, MAX(nav) maximum_nav, MIN(nav) minimum_nav FROM nav_history GROUP BY code 
)

select *
from source_data
