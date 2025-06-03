# Write your MySQL query statement below
select R.contest_id , round(coalesce(count(*)*100 / Nullif((select count(*) from Users),0),0),2) as percentage
-- subquery ในตัวหารได้ โดยการนับจะใช้ select count() from ... 
-- ใช้ count(select * from ... ) ไม่ได้ ผิดSyntax เนื่องจาก count มันใช้กับ column ไม่ใช่ กับ Select ที่เป็น subquery
from Register R
group by R.contest_id
order by percentage desc , R.contest_id asc ;