with sports_league as (
    select *
    from {{ ref('int_sports_league') }}
),

final as (
    select
        f_name as f_name,
        l_name as l_name,
        date_of_birth as date_of_birth,
        membership_start_date as membership_start_date,
        last_active_date as last_active_date,
        company_name as company_name,
        score as score,
        state as state,
        source as source
    from sports_league
    where not (
        born_after_becoming_member
        or became_member_after_last_activity
    )
    and company_name is not null
)

select *
from final
