-- Deliverable 1 - The Number of Retiring Employees by Title
--
--Create a Table for all employees and their titles who started between 1952 and 1955
SELECT e.emp_no, 
	   e.first_name,
	   e.last_name,
   	   t.title,
	   t.from_date,
	   t.to_date
Into retirement_titles
FROM employees as e
join titles as t
On (e.emp_no = t.emp_no)
WHERE birth_date BETWEEN '1952-01-01' AND '1955-12-31'
Order By emp_no;

Select * From retirement_titles

-- Use Dictinct with Orderby to remove duplicate rows
SELECT DISTINCT ON (emp_no) emp_no,
first_name,
last_name,
title,
from_date,
to_date
INTO retirement_titles_unique
FROM retirement_titles
ORDER BY emp_no, to_date DESC;

Select * From retirement_titles_unique

--Retrieve the number of employees by their most recent job title who are about to retire.

Select Count(Title),Title 
Into retiring_titles
from retirement_titles_unique
Group by Title
Order by count Desc

Select * From retiring_titles

--Deliverable 2 - The Employees Eligible for the Mentorship Program
--
--Write a query to create a Mentorship Eligibility table that holds the employees who are eligible to participate in a mentorship program.

SELECT e.emp_no, 
	   e.first_name, 
	   e.last_name, 
	   e.birth_date,
	   de.from_date,
	   de.to_date,
	   t.title
INTO emp_temp
From Employees as e
join Dept_emp as de
on (e.emp_no = de.emp_no)
join titles as t
on (e.emp_no = t.emp_no);

SELECT DISTINCT ON (emp_no) emp_no, 
	first_name, 
	last_name, 
	birth_date,
	from_date,
	to_date,
	title
Into mentorship_availability	
From emp_temp
WHERE (to_date = '9999-01-01')
AND (birth_date BETWEEN '1965-01-01' AND '1965-12-31')
--Group by emp_no
Order by emp_no;

Select * from mentorship_availability

---Deliverable 3
-- Query 1 - Export Employee count by department number
SELECT COUNT(ce.emp_no), de.dept_no, 
INTO retire_by_dept
FROM current_emp as ce
LEFT JOIN dept_emp as de
ON ce.emp_no = de.emp_no
GROUP BY de.dept_no

Select * from retire_by_dept

--Query 2 - List of potential mentee employees by title and the number of years they have been in their positions

Select Date_PART('year','8/1/2021'::date) - Date_Part('year',m.from_date), m.title, m.emp_no
Into potential_internal_promotes
From mentorship_availability as m

Select * from potential_internal_promotes
