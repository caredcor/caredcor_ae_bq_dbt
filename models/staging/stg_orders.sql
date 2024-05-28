{{ config(
    materialized='table'
) }}

with base as (
    select * from {{ source('northwind' , 'orders')}}
)
select 
    *,
    current_timestamp() as ingestion_timestamp
from base