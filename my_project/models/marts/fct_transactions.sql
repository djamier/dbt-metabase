select
    {{ dbt_utils.generate_surrogate_key(['a.order_date']) }} as order_date_key
    , {{ dbt_utils.generate_surrogate_key(['b.product_id']) }} as product_key
    , {{ dbt_utils.generate_surrogate_key(['a.province_id', 'a.city_id']) }} as address_key
    , {{ dbt_utils.generate_surrogate_key(['a.customer_id']) }} as customer_key
    , b.order_detail_id
    , a.order_id
    , b.qty
    , b.item_price
    , b.qty * b.item_price as subtotal_products
from {{ ref('stg_orders') }} as a
inner join {{ ref('stg_order_details') }} as b
    on b.order_id = a.order_id
