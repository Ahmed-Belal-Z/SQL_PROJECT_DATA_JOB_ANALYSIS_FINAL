/*
Question: What are top-paying data analyst jobs?
-Identify the top 10 highest-paying Data Analyst roles that are available remotley.
-Focuses on job postings with specified salaries (remove nulls).
-Why? Highlight the top-paying opportunities for Data Analysts, 
offering insights into the current market trends and demand for analytical skills.
*/

SELECT 
    job_id,
    job_title,
    job_location,
    job_schedule_type,
    salary_year_avg,
    job_posted_date,
    name AS company_name

FROM
    job_postings_fact

LEFT JOIN company_dim ON job_postings_fact.company_id = company_dim.company_id

WHERE
    job_title_short = 'Data Analyst' and
    job_location = 'Anywhere' and
    salary_year_avg IS NOT NULL

ORDER BY
    salary_year_avg DESC

LIMIT 10