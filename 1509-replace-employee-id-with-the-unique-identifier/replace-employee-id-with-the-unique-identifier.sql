# Write your MySQL query statement below
select EU.unique_id, EY.name 
from Employees EY 
left Join EmployeeUNI EU 
on EY.id = EU.id;