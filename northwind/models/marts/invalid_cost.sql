select count(*) as no_of_orders, orders_key, unit_price, quantity, discount, cost 
from northwind.marts.fact_orders
where cost=0
group by orders_key, unit_price, quantity, discount, cost