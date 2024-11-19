select
    employee_id,
    concat(first_name,' ', last_name) as full_name,
    birth_date,
    hire_date,
    address,
    city,
    country
from {{ source('northwind', 'employees')}}