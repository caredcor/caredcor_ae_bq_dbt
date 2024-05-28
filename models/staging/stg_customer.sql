{{ config(
    materialized='table'
) }}

with base as (
    select * from {{ source('northwind' , 'customer')}}
)
select 
    *,
    current_timestamp() as ingestion_timestamp
from base