# Write your MySQL query statement below
select author_id as id
from Views as V 
where V.author_id = V.viewer_id
group by V.author_id
order by V.author_id asc ;