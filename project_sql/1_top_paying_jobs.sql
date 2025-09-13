/*
Qeustion: What are the top-paying Data Analysis jobs?
-Indetify the top 10 highest-paying Data analyst roles that are available remotely.
-Focus on job postings with specified salaries(remove nulls).
-Why?Highlight the top-paying opprtunities for Data Analysts, offering insights into employment trends.
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
LEFT JOIN company_dim ON
  job_postings_fact.company_id = company_dim.company_id
WHERE
  job_title_short = 'Data Analyst'
  And job_location = 'Anywhere'
  AND salary_year_avg IS NOT NULL
  ORDER BY
  Salary_year_avg DESC
  LIMIT 10;
/*
🔑 Key Findings
💰 Salary Distribution

Highest salary: $650,000 (Mantys – Data Analyst).

Lowest in top 10: $184,000 (Get It Recruit – ERM Data Analyst).

Median salary: ≈ $211,000.

Most salaries cluster between $185K–$335K, excluding Mantys’ outlier.

🏢 Companies Paying the Most

Mantys tops the list with a standout salary far above peers.

Meta, AT&T, Pinterest, UCLA Healthcare, SmartAsset, Motional represent major players.

SmartAsset appears twice, signaling consistent high investment in analyst roles.

📅 Posting Timeline

Jobs were posted steadily throughout 2023, across all quarters.

No seasonal spike — high-paying roles appear consistently year-round.

💡 Insights

Extreme Outlier: Mantys’ $650K role is far outside typical market salaries. Excluding it provides a clearer range of $185K–$335K.

Seniority Drives Pay: Roles with Director and Principal titles dominate, showing leadership responsibility directly links to higher compensation.

Remote is Standard: All top-paying roles are full-time remote, confirming that remote opportunities are strong even at the highest salary levels.

Tech & Finance Dominate: The companies offering these roles highlight the industries most invested in data — particularly technology, finance, and healthcare.
*/