{{
    config(
        materialized='table'
    )
}}

SELECT
* FROM raw.globalmart.customers