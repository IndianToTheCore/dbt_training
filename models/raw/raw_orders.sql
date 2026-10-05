{{ config(materialized='view') }}

select *
from raw.globalmart.orders