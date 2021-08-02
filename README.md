# Pewlett-Hackard-Analysis

Deliverable 3: Employee database analysis

##Overview
As an increasing number of Pewlett-Hackard employees are reaching retirement age, there is concern that valuable institutional knowledge may be lost and key roles may become vacant if we don't act preemptively to preserve the integrity of knowledge and prepare to fulfill employment gaps. This analysis is designed to determine the number of retiring employees per title and identify employees who are eligible to participate in a mentorship program. 

##Results
Provide a bulleted list with four major points from the two analysis deliverables. Use images as support where needed. When analyzing the total counts of employees by job title, we can identify several key factors statistics that put this issue in perspective: 

 
                                           
Figure 1 - Number of Retirees by job title (https://github.com/Roland791/Pewlett-Hackard-Analysis/blob/main/Images/Figure%201%20-%20eligible%20retirees%20count%20by%20job%20title.PNG)
 
Figure 2- Available Mentees by Job Title (https://github.com/Roland791/Pewlett-Hackard-Analysis/blob/main/Images/Figure%202%20-%20elegible%20mentorship%20count%20by%20job%20title.PNG)
 

•	There are 60 times more retiring employees than employees available for mentorship (90,398 vs 1,549)
•	Senior technical positions are at greatest risk of knowledge loss 
•	The disparity of retirees vs mentees means that there will need to be a focus on hiring new talent 
•	While there is only a small number of Managers retiring, there appear to be no immediate managers currently available to transition those positions


##Summary
1) How many roles will need to be filled as the "silver tsunami" begins to make an impact? 
There are currently 90,398 employees that will be eligible for retirement and will potentially need to be replaced.
2) Are there enough qualified, retirement-ready employees in the departments to mentor the next generation of Pewlett Hackard employees? 
There are more than enough retirement eligible employees to mentor (90,398), but an absolute lack of employees who are eligible for mentorship (1,549).

Additional queries can be performed to help make decisions on how to further quantify the retirees and how they will impact the company. 

Query 1 – Retiring Employees by department:
			
			SELECT COUNT(ce.emp_no), de.dept_no, 
			INTO retire_by_dept
			FROM current_emp as ce
			LEFT JOIN dept_emp as de
			ON ce.emp_no = de.emp_no
			GROUP BY de.dept_no

			Select * from retire_by_dept
 
Figure 3 (https://github.com/Roland791/Pewlett-Hackard-Analysis/blob/main/Images/Figure%203%20-%20Query%201%20-%20employee%20count%20be%20dept..PNG)

Query 2 – Identify the number of years mentees have been at their current positions (to give a better idea of potential internal promotion opportunities:
			
			Select Date_PART('year','8/1/2021'::date) - Date_Part('year',m.from_date), m.title, m.emp_no
			Into potential_internal_promotes
			From mentorship_availability as m

			Select * from potential_internal_promotes

 
Figure 4 - https://github.com/Roland791/Pewlett-Hackard-Analysis/blob/main/Images/Figure%204%20-%20mentees%20and%20number%20of%20years%20worked.PNG
