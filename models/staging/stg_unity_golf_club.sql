with src as (
    select *
    from {{ source('raw', 'unity_golf_club') }}
),

final as (
    select
        company_id as company_id,
        first_name as f_name,
        last_name as l_name,
        score as score,
        state as state,
        to_date(dob, 'YYYY/MM/DD') as date_of_birth,
        to_date(last_active, 'YYYY/MM/DD') as last_active_date,
        to_date(member_since::varchar, 'yyyy') as membership_start_date
    from src
)

select *
from final
