# Write your MySQL query statement below
select M.name
from Employee E
left join Employee M
on E.managerId = M.id
group by M.id
having count(M.id)>=5