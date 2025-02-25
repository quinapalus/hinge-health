with src as (
    select *
    from {{ source('raw', 'us_softball_league') }}
),

final as (
    select
        company_id as company_id,
        score as score,
        us_state as us_state,
        split_part(name, ' ', 1) as f_name,
        split_part(name, ' ', 2) as l_name,
        to_date(date_of_birth, 'MM/DD/YYYY') as date_of_birth,
        to_date(last_active, 'MM/DD/YYYY') as last_active_date,
        to_date(joined_league::varchar, 'yyyy') as membership_start_date
    from src
)

select *
from final
