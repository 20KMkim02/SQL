# Write your MySQL query statement below
select st.student_id , st.student_name ,sj.subject_name , count(ex.subject_name) as attended_exams
from Students as st
cross join Subjects sj
# cross join เป็นการทำ Cartesian product
left join Examinations ex
on st.student_id = ex.student_id and sj.subject_name = ex.subject_name
group by st.student_id , st.student_name ,sj.subject_name
# group by สามารถทำกับ column มากกว่า 1 ได้ (เหมือนอยากตรึงCollumnไหนไว้ก็เลือกอันนั้น)
order by st.student_id , st.student_name ,sj.subject_name
