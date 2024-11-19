select
    {{dbt_utils.generate_surrogate_key(['p.product_id'])}} as product_key,
    p.product_name,
    p.units_in_stock,
    p.units_on_order,
    p.discontinued,
    c.category_id,
    c.category_name,
    s.company_name,
    s.supplier_id,
    s.supplier_name,
    s.supplier_address,
    s.supplier_country,
    s.supplier_region,
    s.supplier_postal_code
from {{ref('products')}} as p
inner join {{ref('categories')}} as c
    on p.category_id = c.category_id
inner join {{ref('suppliers')}} as s
    on s.supplier_id = p.supplier_id

