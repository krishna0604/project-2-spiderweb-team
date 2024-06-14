{{ config(
    materialized='table'
) }}

select
     customerid,
     companyname,
     contactname,
     country
from
    {{ source('staging','customers') }}
