# Pewlett-Hackard Mentorship Program Analysis

## Analysis Overview

### The purpose of this project was to process all of the available employee data using SQL to answer the following questions:
####    1. How many employees will be retiring in each position?
####    2. Who are the current employees who will not be retiring who are the ideal age and seniority to participate in a mentorship program and replace the retirees?

## Results

### Number of Retiring Employees by Title

![retiring_titles](/Data/retiring_titles.png)

####    -The above table was created using a series of SQL queries and represents a unique count of the employees who are slated for retirement in the near future.
####    -The table accounts only for employees whose birthdays are between Jan 1, 1952 and Dec 31, 1955 and who are currently employed, which was part of the query's filter..
####    -The count is also unique, meaning each employee is only counted once even if they have held multiple titles over the course of their time with the company. The latest title is the one tallied.

### Number of Employees Eligible for Mentorship by Title

####    -A series of queries was run to create a list of employees born between Jan 1, 1965 and Dec 31, 1965 and who are currently at the company. This list represents the employees eligible to participate as mentors in the mentorship program.


## Summary

### Number of Roles to be Filled

![retiring_titles](/Data/retiring_titles.png)

####    - As might be expected when dealing with retirees, the number of senior positions significantly outnumbers the number of junior positions. 
####    - Only two manager positions are soon to retire, which is a relief considering replacing them might be the most difficult.
####    - This presents a unique opportunity for younger employees to fill these senior roles, but some may require mentorship before being ready. Thus a mentorship program for retiring employees to mentor younger employees has been suggested.

### Number of employees eligible to provide mentorship

![mentorship_titles](/Data/mentorship_titles.png)

#### The above table shows the number of employees eligible to participate as mentors in the mentorship program by title. 

![comparison](/Data/eligibile_mentors_to_retiring_titles.png)

#### A simple inner join was used to combine these tables to illustrate the number of available mentors to potention positions that will need to be filled.

![ratios](/Data/eligibile_mentors_to_retiring_titles_ratios.png)

#### An additional table was made to include a ratio of mentors to soon-to-be vacant positions. This table will allow the company to identify which positions will need to be more urgently and aggressively filled from outside the company. In this case it appears the ratio of senior staff mentors to senior staff vacancies is much lower than the other titles, and thus will require more outside hiring.