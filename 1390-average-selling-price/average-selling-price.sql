# Write your MySQL query statement below
select P.product_id
,round(COALESCE(sum(P.price * U.units)/NULLIF(sum(U.units),0),0),2) as average_price
from Prices P
left join UnitsSold U
on P.product_id = U.product_id
and U.purchase_date between P.start_date and P.end_date
#การใช้ where filter ไม่เวิ้ก ถ้าลองมาใช้ and มันจะทำได้มากกว่า
# เช่น Test case ที่ 15 มันไม่มีอะไรใน U เลย แต่พอใช้ and มันจะได้ False & False เลยไม่ join
group by P.product_id ;