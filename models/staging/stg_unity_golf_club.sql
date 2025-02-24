WITH src AS (
    SELECT *
    FROM {{ source('raw', 'unity_golf_club') }}
)

SELECT
   first_name,
   last_name,
   TO_DATE(dob,'YYYY/MM/DD') as date_of_birth,
   company_id,
   TO_DATE(last_active,'YYYY/MM/DD') as last_active_date,
   score,
   to_date(member_since::varchar, 'yyyy') as membership_start_date,
   state
FROM src
