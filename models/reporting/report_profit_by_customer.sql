SELECT
    customerid, segment, country,
    sum(orderprofit) as totalprofit
from {{ ref('stg_orders') }}
group by 
 customerid, 
 segment, 
 country