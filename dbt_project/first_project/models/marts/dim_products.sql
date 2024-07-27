{{ config(
    materialized='table',
    post_hook='
        alter table {{ this }} add primary key (product_key);
    '
)}}

-- Define the model
select
    {{ dbt_utils.generate_surrogate_key(['a.product_id']) }} as product_key,
    a.product_id,
    b.product_category_id,
    a.product_name,
    b.product_category_name,
    a.size,
    a.price
from {{ ref('stg_products') }} as a
left join {{ ref('stg_product_categories') }} as b
    on b.product_category_id = a.product_category_id
