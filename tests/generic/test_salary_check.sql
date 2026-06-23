{% test salary_check(model, column_name) %}

select *
from {{ model }}
where {{ column_name }} < 40000

{% endtest %}