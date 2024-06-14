{{ config(
    materialized='table'
) }}

select 
     productid,
     productname,
     supplierid,
     categoryid,
     unitprice
from 
    {{ source('staging','products') }}
