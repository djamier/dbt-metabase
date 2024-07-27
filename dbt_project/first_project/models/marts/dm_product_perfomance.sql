select
    b.product_name
    , b.product_category_name
    , count(1) as product_sold
from {{ ref('fct_transactions') }} as a
left join {{ ref('dim_products') }} as b
    on b.product_key = a.product_key
group by 1, 2
order by 3 desc
