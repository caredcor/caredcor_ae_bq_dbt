{{ config(
    materialized='table'
) }}

with base as (
    select * from {{ source('northwind' , 'invoices')}}
)
select 
    *,
    current_timestamp() as ingestion_timestamp
from base