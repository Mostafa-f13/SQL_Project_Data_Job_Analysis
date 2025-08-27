/*
Question: What are the top skills based on salary?
- Look at the average salary with each skill for data analyst postions.
- Focus on roles with specified salaries (remove nulls), reagrdless fo location.
- Why? It reveals how deferent skills inpact slarary levels for data analysts and help identfy the most lucrative skills.
*/
SELECT
    skills,
    ROUND(AVG(salary_year_avg), 0) AS avg_salary
From 
    job_postings_fact
Inner join skills_job_dim ON job_postings_fact.job_id = skills_job_dim.job_id
Inner join skills_dim ON skills_job_dim.skill_id = skills_dim.skill_id
WHERE
    job_title_short = 'Data Analyst'
    AND salary_year_avg IS NOT NULL
    --And job_work_from_home = TRUE
GROUP BY
    skills
ORDER BY
    avg_salary DESC
LIMIT 25;

/*
⚡ Quick Insights: Top 25 Highest-Paying Data Analyst Skills
1. Rare/Niche Tools Command Huge Salaries

SVN ($400k) and Solidity ($179k) top the list — these are highly specialized and less common in traditional Data Analyst roles.

They likely appear in very specific industries (finance, blockchain, legacy enterprise systems), which explains the extreme salaries.

2. Machine Learning & AI Skills Pay Premium

Keras ($127k), PyTorch ($125k), TensorFlow ($120k), Hugging Face ($123k), and MXNet ($149k) show that ML/AI libraries push salaries above $120k.

Analysts who branch into machine learning engineering or applied AI see higher pay opportunities.

3. Cloud, DevOps & Big Data Stack Are Valuable

Terraform ($146k), VMware ($147k), Kafka ($130k), Airflow ($116k), Cassandra ($118k) all indicate demand for data pipeline, orchestration, and infrastructure skills.

This shows that employers want analysts who can handle modern data ecosystems, not just analyze spreadsheets.

4. Programming & Data Wrangling Tools

GoLang ($155k), Perl ($124k), Scala ($115k) → languages outside the typical analyst toolbox, but highly paid when required.

dplyr ($147k) → shows R’s continued importance in certain advanced analytics environments.

5. Collaboration & Workflow Platforms

Tools like GitLab ($134k), Bitbucket ($117k), Atlassian ($118k), Notion ($118k) show that workflow/collaboration tools are valued in high-paying environments.

While not “hardcore analytics,” they reflect skills in team-oriented, large-scale data projects.

📌 Takeaways

Specialization = High Pay → Blockchain (Solidity), legacy tools (SVN), and niche frameworks = top salaries, but few roles.

AI/ML Frameworks are Gold → Analysts moving toward data science/ML hybrid roles unlock higher pay.

Cloud & Infrastructure Knowledge → Big salaries are linked to handling pipelines, data flows, and scalable systems.

Well-rounded Analysts Win → Knowing SQL, Python, and Tableau gets you hired, but adding ML or cloud skills gets you paid more.
*/




