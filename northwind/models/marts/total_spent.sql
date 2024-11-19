select 
    dc.customer_name, 
    sum(fo.cost) as total_spent,
    RANK() OVER (ORDER BY SUM(fo.cost) DESC) AS customer_rank
from {{ref('fact_orders')}}  as fo
inner join {{ref('dim_customer')}} as dc
on dc.customer_key = fo.customer_key
group by dc.customer_name