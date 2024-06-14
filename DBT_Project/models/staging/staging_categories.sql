{{ config(
    materialized='table'
) }}

select 
     categoryid,
     categoryname
from
    {{ source('staging','categories') }}
