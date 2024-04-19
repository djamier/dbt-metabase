select
    {{ dbt_utils.generate_surrogate_key(['a.province_id', 'city_id']) }} as address_key
    , a.province_id
    , b.city_id
    , a.province_names
    , b.city_names
from {{ ref('stg_provinces') }} as a
left join {{ ref('stg_cities') }} as b
    on b.province_id = a.province_id
