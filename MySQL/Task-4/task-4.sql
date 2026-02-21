--problem-1
select firstName, lastName, city, state
from Person P left join Address A
on P.personId = A.personId

--********************************************************************
-- problem2
select unique_id , name
from Employees E left join EmployeeUNI Eu
on  E.id = Eu.id

--********************************************************************
--problem-3
select customer_id , count(*) as count_no_trans 
from Visits V left join Transactions T
on V.visit_id = T.visit_id
where T.visit_id is Null
group by customer_id

--********************************************************************
-- problem-4
select p.project_id ,round((sum(e.experience_years*1.0)/ count(p.project_id)) ,2)
as average_years
from Employee e inner join Project p
on e.employee_id = p.employee_id
group by p.project_id

--********************************************************************
-- problem-5 // **** important
select [name]
from SalesPerson 
where sales_id not in(
    select sales_id 
    from Company C right join Orders O
    on C.com_id = O.com_id
    where C.name = 'Red' 
)

--********************************************************************
--problem-6
select W1.id
from Weather w1 join Weather w2
on datediff(day,w2.recordDate,w1.recordDate) = 1
where w1.temperature > w2.temperature 

--********************************************************************
-- problem-7
select a1.machine_id , round(avg(a2.timestamp - a1.timestamp),3) as processing_time
from Activity a1 join Activity a2
on a1.machine_id = a2.machine_id
and a1.process_id = a2.process_id  
and a1.activity_type = 'start' 
and a2.activity_type = 'end'
group by a1.machine_id

--********************************************************************
--problem-8
select s.student_id , s.student_name , Sub.subject_name , count(E.subject_name) as attended_exams
from Students s cross join Subjects Sub
left join Examinations E
    on s.student_id = E.student_id
   and Sub.subject_name = E.subject_name
group by s.student_id , s.student_name , Sub.subject_name
order by s.student_id , Sub.subject_name

--********************************************************************
--problem-9
select e2.name
from Employee e1 join Employee e2
on e1.managerId = e2.id
group by e1.managerId ,e2.name
having count(e1.id) >= 5

--********************************************************************
-- problem 10
select s.user_id,
round(ifnull((sum(c.action = 'confirmed')/count(c.action)) ,0),2)
as confirmation_rate 

from Signups s left join Confirmations c
on s.user_id = c.user_id 
group by s.user_id

--********************************************************************
-- problem-11
 -- Error!!!!!!!


 --********************************************************************
--problem-12
--items for defeating me--
select u.user_id as buyer_id , u.join_date , count(O.order_date)as orders_in_2019
from Users u left join Orders O 
    on u.user_id = O.buyer_id
and O.order_date >= '2019-01-01' and O.order_date < '2020-01-01'
group by u.user_id,u.join_date
