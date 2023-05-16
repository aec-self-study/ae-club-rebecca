
{{ config(
    materialized='table'
 ) }}

select 
  customers.id as customer_id, 
  customers.name, 
  customers.email, 
  min(orders.created_at) as first_order_at, 
  count(orders.id) as number_of_orders
from {{ source('coffee_shop', 'customers') }} customers
left join {{ source('coffee_shop', 'orders') }} orders on customers.id = orders.customer_id 
group by customers.id, customers.name, customers.email
order by first_order_at 
