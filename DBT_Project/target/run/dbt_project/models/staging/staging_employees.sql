
  
    

  create  table "postgres"."public"."staging_employees__dbt_tmp"
  
  
    as
  
  (
    

select
     employeeid,
     lastname,
     firstname,
     title,
     hiredate
from
    "postgres"."public"."employees"
  );
  