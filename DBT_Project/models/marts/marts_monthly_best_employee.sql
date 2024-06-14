{{ config(
    materialized='table'
) }}

WITH employee_revenue AS (
    SELECT
        EXTRACT(MONTH FROM o.orderDate) AS month,
        EXTRACT(YEAR FROM o.orderDate) AS year,
        e.employeeID,
        CONCAT(e.firstName, ' ', e.lastName) AS employee_name,
        SUM((od.unitPrice * (1 - od.discount)) * od.quantity) AS gross_revenue
    FROM
        {{ ref('staging_orders') }} o
    JOIN {{ ref('staging_order_details') }} od ON o.orderID = od.orderID
    JOIN {{ ref('staging_employees') }} e ON o.employeeID = e.employeeID
    GROUP BY
        EXTRACT(MONTH FROM o.orderDate),
        EXTRACT(YEAR FROM o.orderDate),
        e.employeeID,
        e.firstName,
        e.lastName
)
SELECT
    month,
    year,
    employeeID,
    employee_name,
    gross_revenue
FROM
    employee_revenue
ORDER BY
    year,
    month,
    gross_revenue DESC
