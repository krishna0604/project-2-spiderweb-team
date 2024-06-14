
  
    

  create  table "postgres"."public"."marts_monthly_supplier_gross_revenue__dbt_tmp"
  
  
    as
  
  (
    

WITH supplier_revenue AS (
    SELECT
        EXTRACT(MONTH FROM o.orderDate) AS month,
        EXTRACT(YEAR FROM o.orderDate) AS year,
        s.companyName AS supplier_name,
        SUM((od.unitPrice * (1 - od.discount)) * od.quantity) AS gross_revenue
    FROM
        "postgres"."public"."staging_orders" o
    JOIN "postgres"."public"."staging_order_details" od ON o.orderID = od.orderID
    JOIN "postgres"."public"."staging_products" p ON od.productID = p.productID
    JOIN "postgres"."public"."staging_suppliers" s ON p.supplierID = s.supplierID
    GROUP BY
        EXTRACT(MONTH FROM o.orderDate),
        EXTRACT(YEAR FROM o.orderDate),
        s.companyName
)
SELECT
    month,
    year,
    supplier_name,
    gross_revenue
FROM
    supplier_revenue
ORDER BY
    year,
    month,
    gross_revenue DESC
  );
  