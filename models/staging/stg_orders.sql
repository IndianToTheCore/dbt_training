SELECT
-- from raw_orders
{{ dbt_utils.generate_surrogate_key(['o.orderid', 'c.customerid','p.productid']) }} as sk_orders,
o.ORDERID, o.ORDERDATE, o.SHIPDATE, o.SHIPMODE,
o.ordersellingprice - o.ordercostprice as orderprofit,
o.ordercostprice,
o.ordersellingprice,
-- from raw_customer
c.customerid,
c.customername,
c.segment,
c.country,
-- from raw_product
p.productid,
p.category,
p.productname,
p.subcategory,
{{ markup() }} as markup,
d.delivery_team   
from {{ ref('raw_orders') }} as o
LEFT JOIN {{ ref('raw_customer') }} as c 
on o.customerID = c.customerid 
LEFT JOIN {{ ref('raw_product') }} as p
on o.productid = p.productid
left JOIN {{ ref('delivery_team') }} as d 
on o.SHIPMODE = d.SHIPMODE


