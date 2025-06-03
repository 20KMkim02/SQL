# Write your MySQL query statement below
select 
round(
100*
coalesce(
(sum(case when D.order_date =D.customer_pref_delivery_date then 1 else 0 end)
   / nullif(count(*),0)
)
,0)
,2) as immediate_percentage
from Delivery D
join (select
    customer_id,
    min(order_date) as first_date
    from Delivery 
    group by customer_id
) F
on D.customer_id = F.customer_id and D.order_date = F.first_date