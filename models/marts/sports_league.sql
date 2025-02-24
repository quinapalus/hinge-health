WITH sports_league AS (
    SELECT *
    FROM {{ ref('int_sports_league') }}
)

select
   first_name,
   last_name,
   date_of_birth,
   member_since,
   last_active,
   company_name,
   score,
   state,
   source
from sports_league
where not (born_after_becoming_member or became_member_after_last_activity)
  and company_name is not null
