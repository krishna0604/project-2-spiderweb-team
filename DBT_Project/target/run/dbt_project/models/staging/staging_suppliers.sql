
  
    

  create  table "postgres"."public"."staging_suppliers__dbt_tmp"
  
  
    as
  
  (
    

select 
     supplierid,
     companyname,
     contactname,
     country
from
    "postgres"."public"."suppliers"
  );
  