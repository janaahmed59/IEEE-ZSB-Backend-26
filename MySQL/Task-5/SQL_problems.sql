-- SQL Problems --
-- problem 1
select email as Email
from Person
group by email
having count(email) > 1

-- problem 2
with WF as(
    select *, Row_Number() over(partition by email order by id) as RN
    from Person
)
delete from WF
where RN > 1

-- problem 3
CREATE FUNCTION getNthHighestSalary(@N INT) RETURNS INT AS
BEGIN
    RETURN (        
        select salary 
        from(
            select salary, Dense_Rank() over (order by salary desc) as
            rnk
            from Employee
        ) t
        where rnk = @N
    );
END

-- problem 4
select *
from(
    select score , dense_rank() over (order by score desc) as rank
    from Scores
) t

-- problem 5
select d.name as Department , e.name Employee , (e.salary) Salary
from Department d join Employee e
on d.id = e.departmentId
where e.salary = (
    select Max(salary) from Employee
    where departmentId = e.departmentId
)