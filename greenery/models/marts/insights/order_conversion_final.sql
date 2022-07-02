SELECT
    {{ dbt_utils.star(ref('order_conversion')) }}
from {{ ref('order_conversion') }}