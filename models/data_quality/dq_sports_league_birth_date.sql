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
        company_id as company_id,
        score as score,
        state as state,
        source as source,
        -- Member was born after becoming a member, which doesn't make any sense
        -- the person is born and then becomes a member
        'Faulty birthdate' as error
    from sports_league
    where born_after_becoming_member
)

select *
from final
