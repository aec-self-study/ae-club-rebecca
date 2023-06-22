 select
  date_trunc(first_order_at, month) as month,
  count(*) as num_users
 
from {{ ref('customers') }}
 
group by 1