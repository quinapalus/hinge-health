WITH src AS (
    SELECT *
    FROM {{ source('raw', 'company') }}
)

SELECT *
FROM src
