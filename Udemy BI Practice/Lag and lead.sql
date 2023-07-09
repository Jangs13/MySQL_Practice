SELECT emp_no, salary,
LAG(salary) OVER w as previous_salary,
LEAD(salary) OVER w AS next_salary,
salary - LAG(salary) OVER w AS Diff_current_prev_salary,
LEAD(salary) OVER w - salary AS Diff_nex_current_salary
FROM salaries
WHERE emp_no BETWEEN 10500 and 10600 AND salary > 80000
WINDOW w AS (partition by emp_no order by  salary)