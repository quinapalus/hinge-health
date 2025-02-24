WITH company AS (
    SELECT *
    FROM {{ ref('stg_company') }}
)

, unity_golf_club AS (
    SELECT *
    FROM {{ ref('stg_unity_golf_club') }}
)

, us_softball_league AS (
    SELECT *
    FROM {{ ref('stg_us_softball_league') }}
)

, us_states_abbreviations AS (
    SELECT *
    FROM {{ ref('us_states_abbreviations') }}
)


, combined as (
    select first_name,
       last_name,
       date_of_birth,
       company_id,
       last_active,
       score,
       to_date(member_since::varchar, 'yyyy') as member_since,
       state,
       'unity_golf_club' as source
from unity_golf_club
union all
select first_name,
       last_name,
       date_of_birth,
       company_id,
       last_active,
       score,
       to_date(joined_league::varchar, 'yyyy') as member_since,
       usa.abbreviation as us_state,
       'us_softball_league' as source
from us_softball_league as usl
join us_states_abbreviations as usa
    on usl.us_state = usa.state
)

select first_name,
       last_name,
       date_of_birth,
       member_since,
       last_active,
       company.company_name,
       combined.company_id,
       score,
       state,
       source,
       date_of_birth > member_since as born_after_becoming_member,
       member_since > last_active as became_member_after_last_activity
from combined
left join company
    on combined.company_id = company.company_id
