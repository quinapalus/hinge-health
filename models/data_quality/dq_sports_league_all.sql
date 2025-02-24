select * from {{ ref('dq_sports_league_birth_date') }}
union all
select * from {{ ref('dq_sports_league_membership') }}
union all
select * from {{ ref('dq_sports_league_company') }} 