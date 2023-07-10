# Temporary Tables in Action-Exercise


-- Exercise #1:
-- Store the highest contract salary values of all male employees in a temporary table called male_max_salaries.
Create temporary table male_max_salary
SELECT e.emp_no, MAX(salary) as max_Salary
from employees e
join salaries s on e.emp_no = s.emp_no and e.gender ='M' 
group by emp_no;

-- Exercise #2:
-- Write a query that, upon execution, allows you to check the result set contained in the male_max_salaries temporary table you created in the previous exercise
DROP table if exists male_max_salary;
SELECT *
FROM male_max_salary;

# Other Features of MySQL Temporary Tables-Exercise

-- Exercise #1:
-- Create a temporary table called dates containing the following three columns:
-- one displaying the current date and time,
-- another one displaying two months earlier than the current date and time, and a
-- third column displaying two years later than the current date and time.

CREATE TEMPORARY TABLE dates
SELECT 
	now(),
	date_sub(NOW(), interval 2 month) as two_month_early,
    date_sub(NOW(), interval -2 year) as two_years_later;
    
-- Exercise #2:
-- Write a query that, upon execution, allows you to check the result set contained in the dates temporary table you created in the previous exercise.
SELECT *
FROM dates;


-- Exercise #3:
-- Create a query joining the result sets from the dates temporary table you created during the previous lecture with a new Common Table Expression (CTE) 
-- containing the same columns. Let all columns in the result set appear on the same row.
WITH cte as(
	SELECT	
		now(),
		date_sub(NOW(), interval 2 month) as two_month_early,
		date_sub(NOW(), interval -2 year) as two_years_later)
SELECT *	
FROM dates d1 JOIN cte c1 ;


-- Exercise #4:
-- Again, create a query joining the result sets from the dates temporary table you created during the previous lecture 
-- with a new Common Table Expression (CTE) containing the same columns. This time, combine the two sets vertically.
WITH cte as(
	SELECT	
		now(),
		date_sub(NOW(), interval 2 month) as two_month_early,
		date_sub(NOW(), interval -2 year) as two_years_later)
SELECT *	
FROM dates d1 UNION ALL SELECT * FROM cte c1 ;


-- Exercise #5:
-- Drop the male_max_salaries and dates temporary tables you recently created.
DROP TABLE IF EXISTS male_max_salaries;