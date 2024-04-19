{{ config(
    materialized='table',
    post_hook='
        alter table {{ this }} add primary key (date_key);
    '
)}}

with date_dim as (
    {{ dbt_date.get_date_dimension("2022-01-01", "2022-12-31") }}
)

select 
    {{ dbt_utils.generate_surrogate_key(['date_day']) }} as date_key
    , *
from date_dim