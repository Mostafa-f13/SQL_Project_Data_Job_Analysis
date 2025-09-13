# Introduction
This project explores the Data Analyst job market using **SQL queries** and real-world job posting data.  
The goal is to answer practical, career-focused questions such as:

- 💰 *What are the top-paying Data Analyst jobs?*  
- 🛠 *Which skills are most in demand for Data Analysts?*  
- 📈 *Which skills are associated with the highest salaries?*  

By analyzing job postings, salaries, and required skills, this project highlights **employment trends** and provides **actionable insights** for anyone pursuing or advancing in a Data Analyst career.  

The findings are designed to help both **job seekers** and **professionals** better understand the evolving landscape of data analytics, identify high-value skills, and recognize which opportunities stand out in the market.

📂 SQL queries are available here: [project_sql folder](/project_sql/)
# Background
This project analyzes the **Data Analyst job market** using real-world job posting data.  
The dataset contains:

- 🏢 Job titles, companies, and locations  
- 💰 Salary information  
- 📅 Posting dates  
- 🛠 Required skills and technologies  

Using **SQL**, I focused on three key questions:  
1. 💼 What are the **top-paying Data Analyst jobs**?  
2. 📊 What are the **most in-demand skills**?  
3. 🚀 Which skills are linked to the **highest salaries**?  

The analysis highlights employment trends while demonstrating SQL skills such as **joins, filtering, grouping, and aggregation**.
# Tools I Used
This project uses the following tools:

- 💾 **SQL** – for querying, joining, and aggregating the job postings data  
- 🖥 **PostgreSQL** – for storing and managing the database  
- 🖊 **Visual Studio Code** – for writing SQL scripts and organizing the project  
- 🔗 **Git & GitHub** – for version control and sharing the project
# The Analysis
Each query in this project aimed at investigating a specific aspect of the Data Analyst job market.  
Here’s how I approached each question:
### 1. Top-Paying Data Analyst Jobs

This query identifies the **10 highest-paying remote Data Analyst roles**, focusing on postings that include a specified salary and joining company information for context.

```sql
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
LEFT JOIN company_dim ON
  job_postings_fact.company_id = company_dim.company_id
WHERE
  job_title_short = 'Data Analyst'
  AND job_location = 'Anywhere'
  AND salary_year_avg IS NOT NULL
ORDER BY
  salary_year_avg DESC
LIMIT 10;
```
**Quick Insights:**  
- 💰 Top salaries tend to come from **senior or specialized roles** (e.g., Director, Principal).  
- 🏢 Tech, finance, and healthcare companies consistently offer high-paying Data Analyst positions.  
- 📅 Remote work is common among top-paying roles, showing flexibility in global markets.  
- 💡 Typical high-paying range (excluding extreme outliers) is **£150K–£250K**, giving a realistic target for aspiring analysts.  
- Skills in **data analysis, leadership, and strategic insight** correlate strongly with higher salaries.

### 2. Skills for Top-Paying Data Analyst Jobs

This query examines the **specific skills required** for the top 10 highest-paying remote Data Analyst roles, helping job seekers align their qualifications with market demands.

```sql
WITH top_paying_jobs AS (
    SELECT
        job_id,
        job_title,
        salary_year_avg,
        name AS company_name
    FROM
        job_postings_fact
    LEFT JOIN company_dim ON job_postings_fact.company_id = company_dim.company_id
    WHERE
        job_title_short = 'Data Analyst'
        AND job_location = 'Anywhere'
        AND salary_year_avg IS NOT NULL
    ORDER BY
        salary_year_avg DESC
    LIMIT 10
)
SELECT 
    top_paying_jobs.*,
    skills
FROM 
    top_paying_jobs
INNER JOIN skills_job_dim ON top_paying_jobs.job_id = skills_job_dim.job_id
INNER JOIN skills_dim ON skills_job_dim.skill_id = skills_dim.skill_id
ORDER BY
    salary_year_avg DESC;
```

**Quick Insights:**

- 💻 SQL (8 mentions) is the most required skill — essential for data extraction and manipulation.

- 🐍 Python (7 mentions) is highly valued for automation, advanced analytics, and data wrangling.

- 📊 Tableau (6 mentions) emphasizes the importance of visualization and communicating insights.

- 📈 R (4 mentions) remains relevant for statistical analysis but is less prevalent than Python.

- ☁️ Cloud & data platforms (Snowflake, Azure, Databricks) appear in several roles, highlighting the need for cloud-based analytics skills.

**KeyTakeaways:**

- Hybrid skill sets combining traditional analysis (SQL, Tableau) with modern tools (Python, cloud platforms) are highly rewarded.

- Python is outpacing R due to its versatility across analytics and machine learning.

- Strong visualization skills remain non-negotiable for top-paying roles.

### 3. Most In-Demand Skills

This query identifies the **top 5 skills most frequently requested** in remote Data Analyst job postings.  
It joins the job postings with the skills table to count the number of times each skill appears.

```sql
SELECT
    skills,
    COUNT(skills_job_dim.job_id) AS demand_count
FROM 
    job_postings_fact
INNER JOIN skills_job_dim ON job_postings_fact.job_id = skills_job_dim.job_id
INNER JOIN skills_dim ON skills_job_dim.skill_id = skills_dim.skill_id
WHERE
    job_title_short = 'Data Analyst'
    AND job_work_from_home = TRUE
GROUP BY
    skills
ORDER BY
    demand_count DESC
LIMIT 5;
```

**Quick Insights:**

- 💻 SQL is the top skill — essential for extracting, cleaning, and transforming data.

- 📊 Excel remains highly relevant for analysis, reporting, and pivot tables.

- 🐍 Python demand is rising, key for automation, advanced analytics, and basic machine learning.

- 📈 Tableau and Power BI highlight the importance of visualization and communicating insights.

- 🎯 Analysts strong in all five skills are positioned for the widest range of job opportunities.

### 4. Top Skills Based on Salary

This query calculates the **average salary for each skill** in Data Analyst roles, highlighting which skills are linked to the highest-paying positions.  
It considers only jobs with a specified salary to give accurate insights, regardless of location.

```sql
SELECT
    skills,
    ROUND(AVG(salary_year_avg), 0) AS avg_salary
FROM 
    job_postings_fact
INNER JOIN skills_job_dim ON job_postings_fact.job_id = skills_job_dim.job_id
INNER JOIN skills_dim ON skills_job_dim.skill_id = skills_dim.skill_id
WHERE
    job_title_short = 'Data Analyst'
    AND salary_year_avg IS NOT NULL
GROUP BY
    skills
ORDER BY
    avg_salary DESC
LIMIT 25;
```
**Quick Insights:**

- 💡 Specialized/Niche tools (SVN, Solidity) command the highest salaries, often in finance, blockchain, or legacy enterprise systems.

- 🤖 Machine Learning & AI tools (Keras, PyTorch, TensorFlow, Hugging Face, MXNet) boost earning potential above $120K.

- ☁️ Cloud, DevOps, and Big Data skills (Terraform, VMware, Kafka, Airflow, Cassandra) are highly valued for handling modern data ecosystems.

- 🐍 Programming & data wrangling tools (Go, Perl, Scala, dplyr) show that advanced programming skills increase pay.

- 🔗 Collaboration & workflow platforms (GitLab, Bitbucket, Atlassian, Notion) are also linked to high-paying roles, reflecting team-oriented environments.

**Key Takeaways:**

- Specialization in niche tools or frameworks can lead to exceptional salaries.

- Combining core analytics skills (SQL, Python, Tableau) with emerging technologies (AI/ML, cloud) significantly increases earning potential.

- Analysts who are well-rounded across analysis, programming, visualization, and modern data platforms are the most competitive in the job market.

# What I Learned
This project was a hands-on journey into the world of data analysis. Key skills I developed include:  

- 🧩 **Complex Query Crafting** – Learned to write multi-join queries, CTEs, and aggregations to answer real-world questions.  
- 📊 **Data Aggregation & Analysis** – Summarized, grouped, and filtered large datasets to uncover trends and insights.  
- 🔍 **Analytical Wizardry** – Translated raw data into actionable insights about salaries, skills, and job opportunities.  
- 🎯 **Insightful Storytelling with Data** – Learned to present findings clearly, making complex trends easy to understand.  

# Conclusion
This project turned raw job postings into actionable insights — like a **data detective** for the Data Analyst world:  

1. **Top-Paying Jobs** – Salaries ranged **$184K–$650K**, mostly senior roles in **tech, finance, and healthcare**, fully remote. (Yes, some jobs pay more than a small country's GDP!)  
2. **Skills for Top-Paying Jobs** – SQL, Python, Tableau, and cloud tools (Snowflake, Azure, Databricks) dominate high-paying roles. Master these, and you might just earn your dream job… and maybe a yacht.  
3. **Most In-Demand Skills** – SQL, Excel, Python, Tableau, and Power BI are consistently requested. Basically, if you can juggle these five, you’re practically a data superhero.  
4. **Top Skills by Salary** – Niche tools (SVN, Solidity), AI/ML frameworks, and cloud/big data skills drive the highest earnings. The rarer your skills, the fatter your paycheck.  

Overall, this project demonstrates my ability to **write complex queries, analyze large datasets, and extract actionable insights** — all while having fun turning numbers into a story.
