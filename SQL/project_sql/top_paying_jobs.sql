SELECT
    job_id,
    job_title,
    salary_year_avg,
    job_schedule_type,
    job_posted_date,
    company_dim.name AS company_name
FROM 
    job_postings_fact
LEFT JOIN company_dim on company_dim.company_id = job_postings_fact.company_id 
WHERE 
    salary_year_avg IS NOT NULL AND
    job_location = 'Anywhere' AND
    job_title_short = 'Data Analyst'
ORDER BY 
    salary_year_avg DESC
LIMIT 10;