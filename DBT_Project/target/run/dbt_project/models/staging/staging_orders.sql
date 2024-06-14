
  
    

  create  table "postgres"."public"."staging_orders__dbt_tmp"
  
  
    as
  
  (
    

SELECT 
     orderid,
     orderdate,
     customerid,
     employeeid,
     freight,
     shipvia
FROM 
    "postgres"."public"."orders"
  );
  