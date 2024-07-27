select
    id::integer as province_id
    , province_names
from {{ source('staging', 'provinces') }}
