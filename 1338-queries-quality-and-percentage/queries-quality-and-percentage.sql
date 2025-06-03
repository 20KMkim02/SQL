# Write your MySQL query statement below
select Q.query_name
, round(avg(Q.rating / Q.position),2) as quality 
, round(
    (100*
    ( select count(*) from Queries Q2 where Q2.rating < 3 and Q2.query_name= Q.query_name ) 
    / (select count(*) from Queries Q3 where Q3.query_name = Q.query_name)
    ) 
,2) as poor_query_percentage
from Queries Q
group by Q.query_name
