select
    id::integer as order_id
    , order_date
    , customer_id
    , province_id
    , city_id
from {{ source('staging', 'orders') }}
