SELECT
*, ordersellingprice - ordercostprice as orderprofit 
from {{ ref('raw_orders') }}
