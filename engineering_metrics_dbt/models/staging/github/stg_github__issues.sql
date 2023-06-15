with source as (
    select * from {{ source('github', 'issue') }}
),

renamed as (
    select
        id as issue_id,
        milestone_id,
        repository_id,
        user_id
        body,
        locked as is_locked,
        number,
        pull_request as is_pull_request,
        state,
        title,
        -- timestamps
        created_at,
        closed_at,
        updated_at
        -- excluded
        -- _fivetran_synced,
    from source

)

select * from renamed