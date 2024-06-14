
  
    

  create  table "postgres"."public"."marts_monthly_category_sold__dbt_tmp"
  
  
    as
  
  (
    

WITH category_sales AS (
    SELECT
        EXTRACT(MONTH FROM o.orderDate) AS month,
        EXTRACT(YEAR FROM o.orderDate) AS year,
        c.categoryID,
        c.categoryName,
        SUM(od.unitPrice * od.quantity * (1 - od.discount)) AS total_sales
    FROM
        "postgres"."public"."staging_orders" o
    JOIN "postgres"."public"."staging_order_details" od ON o.orderID = od.orderID
    JOIN "postgres"."public"."staging_products" p ON od.productID = p.productID
    JOIN "postgres"."public"."staging_categories" c ON p.categoryID = c.categoryID
    GROUP BY
        EXTRACT(MONTH FROM o.orderDate),
        EXTRACT(YEAR FROM o.orderDate),
        c.categoryID,
        c.categoryName
)
SELECT
    month,
    year,
    categoryID,
    categoryName,
    total_sales
FROM
    category_sales
ORDER BY
    year,
    month,
    total_sales DESC
  );
  