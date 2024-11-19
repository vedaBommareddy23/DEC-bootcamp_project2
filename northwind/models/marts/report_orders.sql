select
    {{ dbt_utils.star(from=ref('fact_orders'), relation_alias='fact_orders', except=[
        "product_key", "customer_key", "order_key", "order_product_key", "employee_key"
    ]) }},
    {{ dbt_utils.star(from=ref('dim_products'), relation_alias='dim_products', except=["product_key"]) }},
    {{ dbt_utils.star(from=ref('dim_customer'), relation_alias='dim_customer', except=["customer_key"]) }},
    {{ dbt_utils.star(from=ref('dim_employee'), relation_alias='dim_employee', except=["employee_key"]) }},
from {{ ref('fact_orders')}} as fact_orders
left join {{ ref('dim_customer')}} as dim_customer on fact_orders.customer_key = dim_customer.customer_key
left join {{ ref('dim_employee')}} as dim_employee on fact_orders.employee_key = dim_employee.employee_key
left join {{ ref('dim_products')}} as dim_products on fact_orders.order_product_key = dim_products.product_key