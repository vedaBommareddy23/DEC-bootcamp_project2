select
    order_id,
    customer_id,
    employee_id,
    order_date,
    required_date,
    shipped_date,
    freight,
    ship_name,
    ship_city,
    ship_country
from {{ source('northwind', 'orders')}}