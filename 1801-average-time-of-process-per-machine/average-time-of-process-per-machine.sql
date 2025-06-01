# Write your MySQL query statement below
select  S.machine_id , round(AVG(E.timestamp-S.timestamp),3) as processing_time
from Activity S
join Activity E
on S.machine_id = E.machine_id and S.process_id = E.process_id
where S.activity_type ='start' and E.activity_type='end'
group by S.machine_id