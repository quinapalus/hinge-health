with company as (
    select *
    from {{ ref('stg_company') }}
),

unity_golf_club as (
    select *
    from {{ ref('stg_unity_golf_club') }}
),

us_softball_league as (
    select *
    from {{ ref('stg_us_softball_league') }}
),

us_states_abbreviations as (
    select *
    from {{ ref('us_states_abbreviations') }}
),

combined as (
    select
        f_name as f_name,
        l_name as l_name,
        date_of_birth as date_of_birth,
        company_id as company_id,
        last_active_date as last_active_date,
        score as score,
        membership_start_date as membership_start_date,
        state as state,
        'unity_golf_club' as source
    from unity_golf_club

    union all

    select
        usl.f_name as f_name,
        usl.l_name as l_name,
        usl.date_of_birth as date_of_birth,
        usl.company_id as company_id,
        usl.last_active_date as last_active_date,
        usl.score as score,
        usl.membership_start_date as membership_start_date,
        usa.abbreviation as state,
        'us_softball_league' as source
    from us_softball_league as usl
    inner join us_states_abbreviations as usa
        on usl.us_state = usa.state
),

final as (
    select
        c.f_name as f_name,
        c.l_name as l_name,
        c.date_of_birth as date_of_birth,
        c.membership_start_date as membership_start_date,
        c.last_active_date as last_active_date,
        c.company_id as company_id,
        comp.company_name as company_name,
        c.score as score,
        c.state as state,
        c.source as source,
        c.date_of_birth > c.membership_start_date as born_after_becoming_member,
        c.membership_start_date
        > c.last_active_date as became_member_after_last_activity
    from combined as c
    left join company as comp
        on c.company_id = comp.company_id
)

select *
from final
