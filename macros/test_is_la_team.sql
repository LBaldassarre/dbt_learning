{% macro test_is_la_team(model, column_name) %}

with validation as (

    select
        {{ column_name }} as city,
        team

    from {{ model }}

),

validation_errors as (

    select
        city

    from validation
    
    where city = ' Los Angeles'
        and team in (' Lakers', ' Clippers')

)

select *
from validation_errors

{% endmacro %}