{{ config(
    materialized='view',
) }}

select
    id::number as province_id
    , province as province_name
    , created as created_by
    , created_ts::timestamp as create_date
    , updated as updated_by
    , updated_ts::timestamp as updated_date
from {{ source('master_table', 'provinces') }}
