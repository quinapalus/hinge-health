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
   -- Member was born after becoming a member, which doesn't make any sense
   -- the person is born and then becomes a member
   'Faulty birthdate' as error
from sports_league
where born_after_becoming_member
