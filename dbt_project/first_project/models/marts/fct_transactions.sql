{{ config(
    materialized='table',
    post_hook='
        alter table {{ this }} add primary key (order_detail_id);
        alter table {{ this }} add constraint fk_order_date_key foreign key (order_date_key) references dwh.dim_dates (date_key);
        alter table {{ this }} add constraint fk_product_key foreign key (product_key) references dwh.dim_products (product_key);
        alter table {{ this }} add constraint fk_address_key foreign key (address_key) references dwh.dim_address (address_key);
        alter table {{ this }} add constraint fk_customer_key foreign key (customer_key) references dwh.dim_customers (customer_key);
    '
)}}

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
