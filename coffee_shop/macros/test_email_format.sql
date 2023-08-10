{% test email_format(model, column_name) %}
    select
        *
    from {{ model }}
 where not regexp_contains({{ column_name }}, r"[A-Za-z0-9._%+-]+@[a-zA-Z0-9-]+\.[a-zA-Z0-9-.]+")
{% endtest %}