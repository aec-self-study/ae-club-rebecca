with source as (
    select * from {{ source('coffee_shop', 'orders') }}
),

renamed as (
    select 
        id as order_id,
        customer_id,
        total as order_total,
        -- timestamps 
        created_at,

        address,
        state,
        zip
    from source
)

select * from renamed