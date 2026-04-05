/*What are the most optimal skills to learn
(AKA it's in high demand and it's a high-paying skill)?
-Identify skills in high demand and associated with high
average salaries for Data analyst roles
-Concentrate on remote positions with specified salaries
-Why? Targets skills that offer job security (high demand)
and financial benefits (high salaries),offering strategic insights 
for career development in Data Analytics */


WITH In_demand_skills AS (
    SELECT
        skills_dim.skills AS Skills,
        COUNT(jpf.job_id) AS job_demand_count,
        AVG (salary_year_avg) AS avg_salary
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
        job_demand_count DESC
)

SELECT
    job_demand_count,
    Skills,
    ROUND (avg_salary,0) AS avg_salary
FROM
    In_demand_skills
WHERE
    job_demand_count > 10
ORDER BY
    job_demand_count DESC,
    avg_salary DESC
LIMIT 5;

/*The strongest combination of demand and salary is concentrated around core analytics skills such as SQL, Python, Tableau, R, and Power BI, making them the most strategically valuable tools for data analysts.
SQL stands out as the single most important skill, with the highest job demand and a strong average salary, reinforcing its role as the foundation of modern data analysis.
More specialized tools such as Snowflake, Azure, AWS, Hadoop, and BigQuery show lower demand but higher salaries, suggesting that technical specialization is a key driver of salary growth after mastering core analytics skills*/