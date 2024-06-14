{{ config(
    materialized='table'
) }}

select 
     supplierid,
     companyname,
     contactname,
     country
from
    {{ source('staging','suppliers') }}
