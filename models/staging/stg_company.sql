with src as (
    select *
    from {{ source('raw', 'company') }}
),

final as (
    select
        company_id as company_id,
        company_name as company_name
    from src
)

select *
from final
