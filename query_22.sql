--find the students with the same marks in physics and chemistry.

create table exams (student_id int, subject varchar(20), marks int);
delete from exams;
insert into exams values (1,'Chemistry',91),(1,'Physics',91)
,(2,'Chemistry',80),(2,'Physics',90)
,(3,'Chemistry',80)
,(4,'Chemistry',71),(4,'Physics',54);


--select * from exams


with cte as (
select *, 
case when subject = 'Chemistry' then 1 else 0 end as taking_chemistry, 
case when subject = 'Physics' then 1 else 0 end as taking_physics
from exams)

select student_id
from cte
group by student_id
having sum(taking_chemistry) = 1 and sum(taking_physics) = 1 and count(distinct marks) = 1