with source as (
    select * from {{source('web_tracking', 'pageviews')}}
),

renamed as (
    select

        id as pageview_id,
        visitor_id,
        customer_id,
        device_type,
        page,
        timestamp as visited_at

    from source
)

select * from renamed