
  
    

  create  table "postgres"."public"."staging_customers__dbt_tmp"
  
  
    as
  
  (
    

select
     customerid,
     companyname,
     contactname,
     country
from
    "postgres"."public"."customers"
  );
  