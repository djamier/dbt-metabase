select
    id::integer as product_id
    , product_name
    , size
    , price
    , product_category_id
from {{ source('staging', 'products') }}
