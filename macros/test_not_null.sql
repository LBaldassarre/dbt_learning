--If we want to change the default not_null, this how we would do it

{% macro default__test_not_null(model, column_name) %}

{% set column_list = '*' if should_store_failures() else column_name %}

select {{ column_list }}
from {{ model }}
where {{ column_name }} is null

{% endmacro %}