SELECT s1.emp_no,s.salary,s.from_date,s.to_date
FROM salaries s 
	JOIN
    (SELECT emp_no, MAX(from_date) as from_date
    FROM salaries
    Group By emp_no) s1
    ON s.emp_no = s1.emp_no
WHERE
	s.from_date = s1.from_date;

SELECT d1.emp_no,d.dept_no,d.from_date,d.to_date
FROM dept_emp d 
	JOIN
    (SELECT emp_no, MAX(from_date) as from_date
    FROM dept_emp 
    Group By emp_no) d1
    ON d.emp_no = d1.emp_no
WHERE
	d.from_date = d1.from_date;





# avg salary of employee from start date with respective dept. 

SELECT

    de2.emp_no, d.dept_name, s2.salary, AVG(s2.salary) OVER w AS average_salary_per_department

FROM

    (SELECT

    de.emp_no, de.dept_no, de.from_date, de.to_date

FROM

    dept_emp de

        JOIN

(SELECT

emp_no, MAX(from_date) AS from_date

FROM

dept_emp

GROUP BY emp_no) de1 ON de1.emp_no = de.emp_no

WHERE

    de.to_date < '2002-01-01'

AND de.from_date > '2000-01-01'

AND de.from_date = de1.from_date) de2

JOIN

    (SELECT

    s1.emp_no, s.salary, s.from_date, s.to_date

FROM

    salaries s

    JOIN

    (SELECT

emp_no, MAX(from_date) AS from_date

FROM

salaries

    GROUP BY emp_no) s1 ON s.emp_no = s1.emp_no

WHERE

    s.to_date < '2002-01-01'

AND s.from_date > '2000-01-01'

AND s.from_date = s1.from_date) s2 ON s2.emp_no = de2.emp_no

JOIN

    departments d ON d.dept_no = de2.dept_no

GROUP BY de2.emp_no, d.dept_name

WINDOW w AS (PARTITION BY de2.dept_no)

ORDER BY de2.emp_no, salary;


