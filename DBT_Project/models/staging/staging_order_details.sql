{{ config(
    materialized='table'
) }}

select 
     orderdetailid,
     orderid,
     productid,
     unitprice,
     quantity,
     discount
from 
    {{ source('staging','order_details') }}
