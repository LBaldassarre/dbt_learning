with teams as (

    select * from {{ ref('example__teams') }}

),

teams_locations as (

    select * from {{ ref('teams_locations') }}

),

final as (

    select 
        teams.team,
        teams_locations.city,
        teams_locations.state,
        teams.team = '{{ var("current_champion") }}' as is_champion
    from teams

    left join teams_locations
        on teams_locations.name = teams.team

)

select *, '{{ invocation_id }}' as invocation_id from final