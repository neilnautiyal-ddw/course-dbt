{{
  config(
    materialized='table'
  )
}}

SELECT
  *
FROM {{ ref('int_fact_orders') }}