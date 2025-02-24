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
   -- there's no corresponding company id - company name between the company model
   -- and the unity_golf_club and us_softball_league
   'Missing Company Name' as error
from sports_league
where company_name is null
