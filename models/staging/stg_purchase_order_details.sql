{{ config(
    materialized='table'
) }}

with base as (
    select * from {{ source('northwind' , 'purchase_order_details')}}
)
select 
    *,
    current_timestamp() as ingestion_timestamp
from base