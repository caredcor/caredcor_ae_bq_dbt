{{ config(
    materialized='table'
) }}

with base as (
    select * from {{ source('northwind' , 'inventory_transactions')}}
)
select 
    *,
    current_timestamp() as ingestion_timestamp
from base