
  
    

  create  table "postgres"."public"."staging_categories__dbt_tmp"
  
  
    as
  
  (
    

select 
     categoryid,
     categoryname
from
    "postgres"."public"."categories"
  );
  