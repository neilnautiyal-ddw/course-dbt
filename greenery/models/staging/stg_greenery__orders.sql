{{
    config(
        materialized = 'view'
    )
}}

with src_greenery_orders as (
    select * from {{ source('src_greenery', 'orders') }}
)

, renamed_recast as (
    select
        order_id
        , promo_id
        , user_id as user_guid
        , address_id
        , created_at as created_at_utc
        , order_cost
        , shipping_cost
        , order_total
        , tracking_id
        , shipping_service
        , estimated_delivery_at
        , delivered_at
        , status
    from src_greenery_orders
)

select * from renamed_recast