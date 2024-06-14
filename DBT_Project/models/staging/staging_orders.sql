{{ config(
    materialized='table'
) }}

SELECT 
     orderid,
     orderdate,
     customerid,
     employeeid,
     freight,
     shipvia
FROM 
    {{ source('staging','orders') }}
