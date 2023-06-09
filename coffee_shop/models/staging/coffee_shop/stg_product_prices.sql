with source as (
    select * from {{ source('coffee_shop', 'product_prices') }}
),

renamed as (
    select 
        id as price_id,
        product_id,
        price,
        created_at as started_at,
        ended_at
   from source
)

select * from renamed