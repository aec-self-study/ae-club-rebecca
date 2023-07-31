{% set product_category = ['coffee_beans', 'merch', 'brewing_supplies']%}

select

  date_trunc(purchase_at, month) as date_month,
  {% for product in product_category %}
  sum(case when product_category = '{{product}}' then price end) as {{product}}_amount,
  {% endfor %}

from {{ ref('orders') }}
group by 1