select
    id::integer as order_detail_id
    , order_id
    , product_id
    , qty
    , item_price
from {{ source('staging', 'order_details') }}
