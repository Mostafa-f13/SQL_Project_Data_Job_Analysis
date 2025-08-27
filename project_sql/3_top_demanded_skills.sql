/*
Question: What are the most in-demand skills for Data Analysts?
-Join job postings to inner join table similar to query 2.
-Identify the top 5 in-demand skills for Data Analysts.
-Focus on all job postings.
Why? Retrives the top 5 skills with the hieghts demand in the job market,
providing insights into the most valuable skills for job seekers.   
*/
SELECT
    skills,
    COUNT(skills_job_dim.job_id) AS demand_count
From 
    job_postings_fact
Inner join skills_job_dim ON job_postings_fact.job_id = skills_job_dim.job_id
Inner join skills_dim ON skills_job_dim.skill_id = skills_dim.skill_id
WHERE
    job_title_short = 'Data Analyst'
    And job_work_from_home = TRUE
GROUP BY
    skills
ORDER BY
    demand_count DESC
LIMIT 5;

    /*
🔑 Insights

SQL is the #1 Essential Skill (7,291 mentions)

SQL dominates demand because every analyst needs to extract, clean, and transform data directly from databases.

Employers clearly view SQL as the non-negotiable foundation for Data Analysts.

Excel Remains Highly Relevant (4,611 mentions)

Despite modern tools, Excel is still a standard for quick analysis, pivot tables, and reporting.

Its popularity shows companies still value analysts who can move between spreadsheets and larger systems.

Python Rising as the Go-To Programming Language (4,330 mentions)

Python’s demand nearly equals Excel’s, signaling its importance for automation, advanced analytics, and machine learning basics.

Analysts with Python stand out for being able to go beyond descriptive analysis.

Data Visualization is Critical (Tableau – 3,745 mentions, Power BI – 2,609 mentions)

Both Tableau and Power BI highlight the importance of communicating insights visually.

Tableau leads, but Power BI’s strong showing reflects demand in companies tied to the Microsoft ecosystem.

📌 What This Means for Job Seekers

Master SQL first → it is the universal requirement.

Don’t neglect Excel → especially in businesses that rely on reporting and quick insights.

Learn Python → to stand out and expand into more advanced roles.

Pick at least one visualization tool (Tableau or Power BI) → to effectively tell stories with data.

🎯 Conclusion

The market shows a balanced demand:

Core data work (SQL, Excel),

Modern programming (Python),

Visualization (Tableau, Power BI).

An analyst strong in all five skills positions themselves for maximum job opportunities and career growth.

    [
  {
    "skills": "sql",
    "demand_count": "7291"
  },
  {
    "skills": "excel",
    "demand_count": "4611"
  },
  {
    "skills": "python",
    "demand_count": "4330"
  },
  {
    "skills": "tableau",
    "demand_count": "3745"
  },
  {
    "skills": "power bi",
    "demand_count": "2609"
  }
]
*/

