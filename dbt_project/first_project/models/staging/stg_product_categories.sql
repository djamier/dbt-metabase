select
    id::integer as product_category_id
    , product_category_name
from {{ source('staging', 'product_categories') }}
