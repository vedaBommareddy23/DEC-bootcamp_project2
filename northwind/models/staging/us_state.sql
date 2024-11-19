with seed_data as (
    select * from {{ ref('us_states') }}
)
select * from seed_data
