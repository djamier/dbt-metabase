select
    id::integer as city_id
    , city_names
    , province_id
from {{ source('staging', 'cities') }}
