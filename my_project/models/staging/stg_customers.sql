select
    id::integer as customer_id
    , first_name
    , last_name
    , gender as customer_gender
from {{ source('staging', 'customers') }}
