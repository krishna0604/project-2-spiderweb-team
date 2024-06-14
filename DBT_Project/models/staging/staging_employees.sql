{{ config(
    materialized='table'
) }}

select
     employeeid,
     lastname,
     firstname,
     title,
     hiredate
from
    {{ source('staging','employees') }}
