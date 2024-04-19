with date_dim as (
    {{ dbt_date.get_date_dimension("2022-01-01", "2022-12-31") }}
)

select 
    *
from date_dim