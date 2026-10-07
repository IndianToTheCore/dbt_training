SELECT
-- from raw_orders
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
p.subcategory
from {{ ref('raw_orders') }} as o
LEFT JOIN {{ ref('raw_customer') }} as c 
on o.customerID = c.customerid 
LEFT JOIN {{ ref('raw_product') }} as p
on o.productid = p.productid

