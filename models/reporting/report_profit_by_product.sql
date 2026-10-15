SELECT
    productid, productname, category, subcategory,
    sum(orderprofit) as totalprofit
from {{ ref('stg_orders') }}
group by 
    productid, 
    productname, 
    category, 
    subcategory
