WITH sports_league AS (
    SELECT *
    FROM {{ ref('int_sports_league') }}
)

select
   {{ dbt_utils.generate_surrogate_key(['first_name', 'last_name', 'date_of_birth', 'company_name']) }} AS primary_key,
   first_name,
   last_name,
   date_of_birth,
   membership_start_date,
   last_active_date,
   company_name,
   score,
   state,
   source
from sports_league
where
  not (born_after_becoming_member or became_member_after_last_activity)
  and company_name is not null
