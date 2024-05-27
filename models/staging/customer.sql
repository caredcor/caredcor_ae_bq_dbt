{{ config(
    materialized='table'
) }}

with base as (
    select * from {{ source('northwind' , 'customer')}}
)
select * from base