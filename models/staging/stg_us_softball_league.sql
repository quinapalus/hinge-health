WITH src AS (
    SELECT *
    FROM {{ source('raw', 'us_softball_league') }}
)

SELECT
   SPLIT_PART(name, ' ', 1) AS first_name,
   SPLIT_PART(name, ' ', 2) AS last_name,
   TO_DATE(date_of_birth, 'MM/DD/YYYY') as date_of_birth,
   company_id,
   TO_DATE(last_active, 'MM/DD/YYYY') as last_active_date,
   score,
   to_date(joined_league::varchar, 'yyyy') as membership_start_date,
   us_state
FROM src
