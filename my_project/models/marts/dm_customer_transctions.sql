select
    b.province_names
    , b.city_names
    , count(distinct a.customer_key) as total
from {{ ref('fct_transactions') }} as a
left join {{ ref('dim_address') }} as b
    on b.address_key = a.address_key
group by 1, 2
order by 3 desc
