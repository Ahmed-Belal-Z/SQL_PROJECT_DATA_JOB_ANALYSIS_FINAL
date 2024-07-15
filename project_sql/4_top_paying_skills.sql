/*
Answer: What are the top paying skills based on salary?
- Look at the average salary associated with each skill for Data Analyst positions.
- Focuses on roles with specified salaries, regardless of location.
- Why? It reveals how different skills impact salary levels for Data Analysts and
    helps identify the most financially rewarding skills to acquire or improve.
*/

SELECT skills,
    ROUND(AVG(salary_year_avg), 0) AS avg_salary

FROM job_postings_fact

INNER JOIN skills_job_dim ON job_postings_fact.job_id = skills_job_dim.job_id
INNER JOIN skills_dim ON skills_job_dim.skill_id = skills_dim.skill_id

WHERE job_title_short = 'Data Analyst' 

AND salary_year_avg IS NOT NULL

-- AND   job_work_from_home = TRUE

GROUP BY skills

ORDER BY avg_salary DESC

LIMIT 25


/*

Here's what we found!

The results :

1. Emerging Technologies and Programming Languages:

Skills in blockchain (Solidity), AI/ML frameworks (DataRobot, Keras, PyTorch, TensorFlow), 
and specific programming languages (Golang, Perl) command high salaries, 
reflecting their growing importance in cutting-edge projects.

2. Cloud Infrastructure and DevOps:

Expertise in cloud and DevOps tools (VMware, Terraform, Twilio, Puppet, Ansible) is highly valued, 
indicating a strong demand for professionals who can manage and automate cloud environments and workflows.

3. Data Management and Collaboration Tools:

Proficiency in database technologies (Couchbase, Cassandra), real-time data processing (Kafka), 
and collaborative platforms (Notion, Atlassian, Bitbucket) highlights the importance of efficient data handling, 
real-time processing, and team collaboration in the industry.

*/
