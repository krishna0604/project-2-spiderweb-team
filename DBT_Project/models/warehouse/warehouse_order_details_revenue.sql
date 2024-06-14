{{ config(
    materialized='table'
) }}

WITH order_details AS (
    SELECT * FROM {{ ref('staging_order_details') }}
),
order_revenue AS (
    SELECT
        orderid,
        productid,
        unitprice,
        quantity,
        discount,
        (unitprice * quantity * (1 - discount)) AS revenue
    FROM order_details
)
SELECT * FROM order_revenue
