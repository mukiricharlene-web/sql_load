/* Question; What are the top paying Data Analyst jobs?
- Identify the top 10 highest paying Data Analyst roles that are available remotely
-Focuses on Job postings with specified salaries (Removes Nulls)
-Why? Highlights the top paying opportunities for Data Analysts offering insights into employment market
*/

SELECT
    jpf.job_id,
    jpf.job_title,
    jpf.job_location,
    jpf.salary_year_avg,
    jpf.job_via,
    jpf.job_posted_date,
    company_dim.name AS companies
FROM
    job_postings_fact AS jpf
JOIN
    company_dim ON company_dim.company_id = jpf.company_id
WHERE
    jpf.job_title_short = 'Data Analyst' AND 
    jpf.salary_year_avg IS NOT NULL AND
    jpf.job_location = 'Anywhere'
ORDER BY
    jpf.salary_year_avg DESC
LIMIT 10;






