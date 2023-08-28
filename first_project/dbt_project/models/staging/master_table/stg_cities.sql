{{ config(
    materialized='view',
) }}

select *
from {{ source('master_table', 'cities') }}
