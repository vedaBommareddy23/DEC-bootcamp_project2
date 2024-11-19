select
    {{dbt_utils.generate_surrogate_key(['c.customer_id'])}} as customer_key,
    c.customer_name,
    c.customer_address,
    c.customer_country,
    c.customer_region,
    c.customer_postal_code,
from {{ref('customers')}} as c
