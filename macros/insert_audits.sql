{% macro insert_audits(action_name) %}

insert into dbt_learning.public.dbt_audits (audit_type)

values ('{{ action_name }}');

commit;

{% endmacro %}