/* QUESTION; What are the most in-demand skills for Data Analysts?
-Identify the top 5 in-demand skills for a Data Analyst
-Why? Retrieves the top 5 skills with the highest demand on the job
market, providing insights into the most valuable skills for job seekers */



SELECT
    skills_dim.skills,
    COUNT(jpf.job_id) AS job_demand_count
FROM
    job_postings_fact AS jpf
INNER JOIN
    skills_job_dim ON jpf.job_id = skills_job_dim.job_id
INNER JOIN
    skills_dim ON skills_job_dim.skill_id = skills_dim.skill_id
WHERE
    jpf.job_title_short = 'Data Analyst' AND
    jpf.job_location = 'Anywhere'
GROUP BY
    skills_dim.skills
ORDER BY
    job_demand_count DESC
LIMIT 5;

