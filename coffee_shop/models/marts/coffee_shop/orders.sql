
{{ config(
    materialized='table'
 ) }} 


with order_items as (
    select * from {{ref('stg_order_items')}}
),

orders as (
    select * from {{ref('stg_orders')}}
),

products as (
    select * from {{ref('stg_products')}}
),

product_prices as (
    select * from {{ref('stg_product_prices')}}
),

joined as (
select
    order_items.order_item_id,
    order_items.product_id,
    order_items.order_id,
    orders.customer_id,
    products.category as product_category,
    product_prices.price,
    orders.created_at as purchase_at,
    case 
        when row_number() over (
            partition by orders.customer_id
            order by orders.created_at
            ) = 1  then 'new'
        else 'returning'
    end as customer_type

    from order_items

    left join products
        on order_items.product_id = products.product_id

    left join orders
        on order_items.order_id = orders.order_id
    
    left join product_prices
        on order_items.product_id = product_prices.product_id
        and orders.created_at between product_prices.started_at and product_prices.ended_at
    

)

select * from joined