
  
    

  create  table "postgres"."public"."staging_order_details__dbt_tmp"
  
  
    as
  
  (
    

select 
     orderdetailid,
     orderid,
     productid,
     unitprice,
     quantity,
     discount
from 
    "postgres"."public"."order_details"
  );
  