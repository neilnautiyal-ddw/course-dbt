{{
  config(
    materialized='table'
  )
}}

SELECT
  *
FROM {{ ref('stg_greenery__products') }}