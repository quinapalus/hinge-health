WITH src AS (
    SELECT *
    FROM {{ source('raw', 'company') }}
)

SELECT
    company_id,
    company_name
FROM src
