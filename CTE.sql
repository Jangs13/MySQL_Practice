-- Exercise 1:Use a CTE (a Common Table Expression) and a SUM() function in 
-- the SELECT statement in a query to find out how many male employees have 
-- never signed a contract with a salary value higher than or equal to the all-time 
-- company salary average.

WITH cte_M AS (
SELECT AVG(salary) as avg_salary from salaries) 
SELECT COUNT(CASE WHEN s.salary < m.avg_salary THEN salary ELSE NULL END) AS low_avg_male_salary_count,
count(s.salary) as no_of_emp_signed
FROM salaries s 
	JOIN
    employees e on s.emp_no = e.emp_no and e.gender = "M"
    CROSS JOIN 
    cte_M m;
    
