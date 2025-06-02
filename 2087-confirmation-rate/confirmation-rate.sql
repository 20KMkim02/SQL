# Write your MySQL query statement below
select S.user_id 
-- ,round(sum(C.action='confirmed')/count(C.action),2) as confirmation_rate
,COALESCE(round(sum(C.action = 'confirmed') / NULLIF(COUNT(C.action), 0), 2), 0) AS confirmation_rate
from Signups S 
left join Confirmations C
on S.user_id = C.user_id
group by S.user_id;
-- COALESCE จะช่วยเติม 0 ถ้าผลลัพธ์ เป็น Null
-- COALESCE(expr1,expr2,expr3,...) จะทำการเลือกค่าตัวแรกที่ไม่ใช่ Null มาใส่ให้
-- NULLIF จะช่วยในการยกเว้นการหารด้วย 0 
-- การทำงานของ NULLIF : NULLIF(expr1 , expr2) 
-- โดยถ้า expr1 ดันเท่ากับ expr2 มันจะ Return Null ให้ เรา'มัก'จะให้ค่ายกเว้นไปอยู่ที่ expr2
-- ถ้า expr1 <> expr2 ก็จะ return expr1 ออกมา