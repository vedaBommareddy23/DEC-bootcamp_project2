with orders as(
    select 
        order_id,
        customer_id,
        employee_id,
        cast(order_date as date) as orderdate,
        cast(shipped_date as date) as shippeddate,
        cast(required_date as date) as requireddate,
        ship_country
    from {{ref('orders')}} 
),
orderdetails as(
    select
        order_id as orderid,
        product_id,
        unit_price,
        quantity,
        discount,
        (unit_price * quantity) * (1 - discount) as cost
    from {{ref('order_details')}}
)

select
    {{ dbt_utils.generate_surrogate_key(['orders.order_id']) }} as orders_key,
    {{ dbt_utils.generate_surrogate_key(['orderdetails.product_id']) }} as order_product_key,
    {{ dbt_utils.generate_surrogate_key(['orders.customer_id']) }} as customer_key,
    {{ dbt_utils.generate_surrogate_key(['orders.employee_id']) }} as employee_key,
    orders.orderdate,
    orders.shippeddate,
    orders.ship_country,
    orders.requireddate,
    orderdetails.unit_price,
    orderdetails.quantity,
    orderdetails.discount,
    orderdetails.cost
from orderdetails
inner join orders
    on orderdetails.orderid = orders.order_id