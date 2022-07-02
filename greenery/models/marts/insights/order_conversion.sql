WITH base AS (
  SELECT 
      (SELECT COUNT (event_id) 
      FROM {{ ref('stg_greenery__events') }}
      WHERE order_id IS NOT NULL) AS order_events,
      COUNT (event_id) AS total_events
  FROM {{ ref('stg_greenery__events') }}
)
, intermediate AS (
    SELECT
      CAST(base.order_events AS FLOAT) / CAST(base.total_events AS FLOAT) AS current_conversion
    FROM base
)

SELECT
  {{ make_percent("current_conversion") }} AS conversion_percent
FROM intermediate
