{{ config(
    materialized='table'
) }}

with base as (
    select * from {{ source('northwind' , 'inventory_transaction_types')}}
)
select 
    *,
    current_timestamp() as ingestion_timestamp
from base