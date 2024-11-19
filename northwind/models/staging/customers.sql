select
    customer_id,
    company_name,
    contact_name as customer_name,
    address as customer_address,
    city as customer_city,
    postal_code as customer_postal_code,
    country as customer_country,
    region as customer_region
from {{ source('northwind', 'customers')}}