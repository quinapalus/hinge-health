WITH sports_league AS (
    SELECT *
    FROM {{ ref('int_sports_league') }}
)

select
   first_name,
   last_name,
   date_of_birth,
   membership_start_date,
   last_active_date,
   company_name,
   company_id,
   score,
   state,
   source,
   -- Membership start date is after last activity date, which doesn't make sense
   -- It should be the other way around
   'Faulty membership start date' as error
from sports_league
where became_member_after_last_activity
