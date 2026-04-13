CREATE DATABASE datahire;
USE datahire;
SELECT * FROM salaries LIMIT 5;

-- 1) What is the average salary overall?
SELECT avg(salary) AS avg_salary
FROM salaries;

-- 2) What is the average salary by job title?
SELECT job_title, avg(salary) AS avg_salary 
FROM salaries
GROUP BY job_title
ORDER BY avg(salary) DESC;

-- 3) Which job titles are in the top 5 highest-paying roles?
SELECT job_title, avg(salary) AS avg_salary
FROM salaries
GROUP BY job_title
ORDER BY avg_salary DESC
LIMIT 5; 

-- 4) How does salary vary with experience_years?
SELECT experience_years, avg(salary) as avg_salary
FROM salaries
GROUP BY experience_years
ORDER BY experience_years;

-- 5) What is the average salary for different experience ranges (e.g., 0–2, 3–5, 6+ years)?
SELECT 
	CASE
		WHEN experience_years BETWEEN 0 AND 2 THEN '0-2 years'
        WHEN experience_years BETWEEN 3 AND 5 THEN '3-5 years'
        ELSE '6+ years'
	END AS experience_range,
    AVG(salary) AS avg_salary
FROM salaries
GROUP BY experience_range
ORDER BY avg_salary DESC;

-- 6) What is the average salary by education level?
SELECT education_level, avg(salary) AS  avg_salary
FROM salaries
GROUP BY education_level
ORDER BY avg_salary DESC;

-- 7) Does skills_count impact salary? (group into low/medium/high)
SELECT 
	CASE
		WHEN skills_count <= 5 THEN 'low skills'
        WHEN skills_count BETWEEN 6 AND 10 THEN 'medium skills'
        ELSE 'high skills'
	END AS skill_level,
    AVG(salary) AS avg_salary
FROM salaries
GROUP BY skill_level
ORDER BY avg_salary;

-- 8) How do certifications affect salary?
SELECT certifications, avg(salary) as avg_salary
FROM salaries
GROUP BY certifications
ORDER BY avg_salary DESC;

-- 9) Which industry offers the highest average salary?
SELECT industry, avg(salary) AS avg_salary
FROM salaries
GROUP BY industry
ORDER BY avg_salary DESC;

-- 10) Does remote_work vs on-site work affect salary?  
SELECT remote_work, avg(salary) AS avg_salary
FROM salaries
GROUP BY remote_work
ORDER BY avg_salary DESC;