select
    supplier_id,
    company_name,
    contact_name as supplier_name,
    city as supplier_city,
    region as supplier_region,
    postal_code as supplier_postal_code,
    country as supplier_country,
    phone as supplier_phone,
    address as supplier_address
from {{ source('northwind', 'suppliers')}}