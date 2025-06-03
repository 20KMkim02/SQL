# Write your MySQL query statement below
select 
DATE_FORMAT(trans_date, '%Y-%m') as month
, T.country
, count(*) as trans_count 
, sum(case when T.state = 'approved' then 1 else 0 end) as approved_count
, sum(T.amount) as trans_total_amount
, sum(case when T.state = 'approved' then T.amount else 0 end) as approved_total_amount
from Transactions T
group by month , T.country 