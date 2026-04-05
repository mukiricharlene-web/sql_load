/* QUESTION; What are the top skills based on salary for Data Analysts?
-Look at the avg salary associated w each skill for Data Analyst positions
-Focus on roles with specified salaries
-Why? It reveals how different skills impact salary levels for Data Analysts
and helps identify the most financially rewarding skills */



SELECT
    skills_dim.skills,
   ROUND (AVG (salary_year_avg),0) AS avg_salary
FROM
    job_postings_fact AS jpf
INNER JOIN
    skills_job_dim ON jpf.job_id = skills_job_dim.job_id
INNER JOIN
    skills_dim ON skills_job_dim.skill_id = skills_dim.skill_id
WHERE
    jpf.job_title_short = 'Data Analyst' AND
    jpf.job_location = 'Anywhere' AND
    jpf.salary_year_avg IS NOT NULL
GROUP BY
    skills_dim.skills
ORDER BY
    avg_salary DESC
LIMIT 30;

/*Higher-paying analyst roles are most strongly associated with technical and infrastructure-focused skills such as PySpark, Databricks, Airflow, and Hadoop.
Python ecosystem tools like Pandas, NumPy, Jupyter, and Scikit-learn show that programmatic analysis and advanced data handling are highly valued in the market.
Salary growth appears to be driven more by technical depth and specialization than by skill popularity alone.*/
