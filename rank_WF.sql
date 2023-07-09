SELECT e.emp_no,e.first_name,e.last_name,s.salary,
RANK() OVER w AS rank_salary
FROM employees e 
	JOIN 	
	salaries s
    ON
    e.emp_no = s.emp_no
where e.emp_no BETWEEN 10500 and 10600
WINDOW w AS (PARTITION BY e.emp_no ORDER BY s.salary DESC);

SELECT e.emp_no,e.first_name,e.last_name,s.salary,
DENSE_RANK() OVER w AS employee_salary_ranking,
e.hire_date,s.from_date,
(year(s.from_date)-year(e.hire_date)) AS years_from_start
FROM employees e 
	JOIN salaries s
    ON e.emp_no = s.emp_no
		AND YEAR(s.from_date) - YEAR(e.hire_date) >=5
where e.emp_no BETWEEN 10500 and 10600
WINDOW w AS (PARTITION BY e.emp_no ORDER BY s.salary DESC);