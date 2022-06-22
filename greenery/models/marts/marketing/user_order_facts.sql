{{
  config(
    materialized='table'
  )
}}

SELECT
  *
FROM {{ ref('int_user_order_facts') }}