--Invalid tweets
select tweet_id
from Tweets
where len(content) > 15

--*************************************************************************************
--Fix Name in a Table
select user_id , UPPER(substring(name,1,1)) + lower(substring(name,2,len(name))) as name
from Users
order by user_id

--*************************************************************************************
--Calculate Special Bonus
select employee_id,Case when employee_id %2=1 and [name] not like 'M%'
                   then salary
                   else 0
                end as bonus
from Employees
order by employee_id

--*************************************************************************************
--Patient with a condition
select patient_id,patient_name,conditions
from Patients
where conditions LIKE 'DIAB1%' or 
conditions like '% DIAB1%'

--*************************************************************************************
--find total time spent
select event_day as day ,emp_id,sum(out_time - in_time) as total_time
from Employees
group by event_day ,emp_id

--*************************************************************************************
--count followers
select user_id , count(follower_id) as followers_count
from Followers
group by user_id
order by user_id

--*************************************************************************************
--Daily leads & partners
select date_id ,make_name , count(Distinct(lead_id)) as unique_leads , count(Distinct(partner_id)) as unique_partners
from DailySales
group by date_id ,make_name

--*************************************************************************************
--Actor & Directors has cooperated
select actor_id , director_id
from ActorDirector
group by actor_id , director_id
having count(actor_id) >=3 and count(director_id)>=3

--*************************************************************************************
--Classes with % student
select class
from Courses
group by class
having count(student) >= 5

--*************************************************************************************
--Game Analysis 
select player_id, min(event_date) as first_login
from Activity
group by player_id

--*************************************************************************************
--Capital Gain/Loss
select stock_name , sum(case when operation = 'Sell' then price 
                        else -price
                        end
                       ) as capital_gain_loss
from Stocks
group by stock_name

--*************************************************************************************
-- second highest salary
-- a solution-1 does not handling case no second highest exist
select salary as SecondHighestSalary
from (
    select salary , dense_rank() over (order by salary desc) as rank
    from Employee
) t
where rank = 2
 
-- a solution-2 that handling case no second highest exist
-- max returns null if conditon fails
 select Max(salary) as SecondHighestSalary 
 from Employee
 where salary <
 (
     select Max(salary) from Employee
 )
