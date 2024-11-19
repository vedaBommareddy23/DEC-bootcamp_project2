select distinct(product_name), orders_key, shippeddate, requireddate
from {{ref('report_orders')}}
where shippeddate>requireddate