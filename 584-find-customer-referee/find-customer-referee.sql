# Write your MySQL query statement below
select name from Customer
where referee_id != 2 or referee_id is null ;
# ใช้ is null มา or เพิ่มในกรณีต้องการค่า null ด้วย