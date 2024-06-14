
  
    

  create  table "postgres"."public"."staging_products__dbt_tmp"
  
  
    as
  
  (
    

select 
     productid,
     productname,
     supplierid,
     categoryid,
     unitprice
from 
    "postgres"."public"."products"
  );
  