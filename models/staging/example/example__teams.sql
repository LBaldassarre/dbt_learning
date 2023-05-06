{{ 
    config(
        tags=["special"]
    )
}}

{{ config(materialized='table') }}

with teams as (

    select 'Lakers' as TEAM
    union all
    select 'Clippers' as TEAM
    union all
    select '76ers' as TEAM
    union all
    select 'Heat' as TEAM
    union all
    select 'Bulls' as TEAM

)

select *, '{{ invocation_id }}' as invocation_id
from teams