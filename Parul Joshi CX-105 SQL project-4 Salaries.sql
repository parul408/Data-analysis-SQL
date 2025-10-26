Create database Salary 

Create Table Salaeies(work_year int ,experience_level varchar (max),employment_type varchar (max),	job_title varchar (max), salary int,salary_currency varchar (max),salary_in_usd int,employee_residence varchar (max),remote_ratio int ,company_location varchar (max),	company_size varchar (max))

 SELECT company_size, COUNT(*) AS employee_count
FROM Salaeies  
WHERE work_year = 2021
GROUP BY company_size;

SELECT job_title, AVG(salary) AS average_salary
FROM Salaries  -- Using the corrected table name "Salaries"
WHERE employment_type = 'PT' AND work_year = 2023
GROUP BY job_title
HAVING COUNT(*) > 50  -- Ensure only job titles with more than 50 employees are included (not countries)
ORDER BY average_salary DESC
LIMIT 3;

SELECT company_location  -- Using "company_location" to identify countries
FROM Salaries
WHERE experience_level = 'MI' AND work_year = 2023
GROUP BY company_location
HAVING AVG(salary) > (SELECT AVG(salary) FROM Salaries WHERE experience_level = 'MI' AND work_year = 2023);

-- Highest Average Salary Location
SELECT company_location, AVG(salary_in_usd) AS highest_avg_salary
FROM Salaries
WHERE experience_level = 'SE' AND work_year = 2023
GROUP BY company_location
ORDER BY highest_avg_salary DESC
LIMIT 1;

-- Lowest Average Salary Location
SELECT company_location, AVG(salary_in_usd) AS lowest_avg_salary
FROM Salaries
WHERE experience_level = 'SE' AND work_year = 2023
GROUP BY company_location
ORDER BY lowest_avg_salary ASC
LIMIT 1;

WITH Salary2023 AS (
    SELECT job_title, AVG(salary_in_usd) AS avg_salary_2023
    FROM Salaries
    WHERE work_year = 2023
    GROUP BY job_title
),
Salary2024 AS (
    SELECT job_title, AVG(salary_in_usd) AS avg_salary_2024
    FROM Salaries
    WHERE work_year = 2024
    GROUP BY job_title
)
SELECT 
    s23.job_title,
    s23.avg_salary_2023,
    s24.avg_salary_2024,
    ((s24.avg_salary_2024 - s23.avg_salary_2023) * 100.0 / s23.avg_salary_2023) AS salary_growth_percentage
FROM Salary2023 s23
JOIN Salary2024 s24 ON s23.job_title = s24.job_title
WHERE s23.avg_salary_2023 IS NOT NULL AND s24.avg_salary_2024 IS NOT NULL -- Exclude job titles that do not exist on both years.
ORDER BY salary_growth_percentage DESC;

-- Top three countries with the highest salary growth for entry-level positions:

WITH Salary2023 AS (
    SELECT company_location, AVG(salary_in_usd) AS avg_salary_2023, COUNT(*) as employee_count
    FROM Salaries
    WHERE work_year = 2023 AND experience_level = 'EN' -- Assuming 'EN' for entry-level
    GROUP BY company_location
    HAVING COUNT(*) > 50
),
Salary2024 AS (
    SELECT company_location, AVG(salary_in_usd) AS avg_salary_2024
    FROM Salaries
    WHERE work_year = 2024 AND experience_level = 'EN' -- Assuming 'EN' for entry-level
    GROUP BY company_location
)
SELECT 
    s23.company_location,
    ((s24.avg_salary_2024 - s23.avg_salary_2023) * 100.0 / s23.avg_salary_2023) AS salary_growth_percentage
FROM Salary2023 s23
JOIN Salary2024 s24 ON s23.company_location = s24.company_location
WHERE s23.avg_salary_2023 IS NOT NULL AND s24.avg_salary_2024 IS NOT NULL
ORDER BY salary_growth_percentage DESC
LIMIT 3;

-- Updating remote work ratio for employees earning more than $90,000 in the US and AU:

UPDATE Salaries
SET remote_ratio = 100
WHERE salary_in_usd > 90000 AND employee_residence IN ('US', 'AU');

-- Salary updates based on percentage increases by level in 2024:

UPDATE Salaries
SET salary_in_usd = 
    CASE 
        WHEN experience_level = 'SE' THEN salary_in_usd * 1.22 -- 22% increase
        WHEN experience_level = 'MI' THEN salary_in_usd * 1.30 -- 30% increase
        WHEN experience_level = 'EN' THEN salary_in_usd * 1.15 -- 15% increase (example)
        -- Add more experience levels and percentages as needed
        ELSE salary_in_usd -- No change for other experience levels
    END
WHERE work_year = 2024;

-- Year with the highest average salary for each job title:
SELECT job_title, work_year
FROM Salaries
WHERE (job_title, salary_in_usd) IN (
    SELECT job_title, MAX(salary_in_usd)
    FROM Salaries
    GROUP BY job_title, work_year
)
GROUP BY job_title
HAVING COUNT(*) = 1;


-- Percentage of employment types for different job titles:
SELECT
    job_title,
    SUM(CASE WHEN employment_type = 'FT' THEN 1 ELSE 0 END) * 100.0 / COUNT(*) AS full_time_percentage,
    SUM(CASE WHEN employment_type = 'PT' THEN 1 ELSE 0 END) * 100.0 / COUNT(*) AS part_time_percentage
FROM Salaries
GROUP BY job_title;

-- Countries offering full remote work for managers with salaries over $90,000:
SELECT employee_residence
FROM Salaries
WHERE job_title LIKE '%Manager%' AND salary_in_usd > 90000 AND remote_ratio = 100
GROUP BY employee_residence;

-- Top 5 countries with the most large companies:
SELECT company_location
FROM Salaries
WHERE company_size = 'L'
GROUP BY company_location
ORDER BY COUNT(*) DESC
LIMIT 5;

-- Percentage of employees with fully remote roles earning more than $100,000:
SELECT 
    (SUM(CASE WHEN remote_ratio = 100 AND salary_in_usd > 100000 THEN 1 ELSE 0 END) * 100.0 / COUNT(*)) AS percentage_remote_high_earners
FROM Salaries;

-- Locations where entry-level average salaries exceed market average for entry level:
WITH MarketAverage AS (
    SELECT AVG(salary_in_usd) AS market_avg
    FROM Salaries
    WHERE experience_level = 'EN' -- Assuming 'EN' is entry-level
)
SELECT company_location
FROM Salaries, MarketAverage
WHERE experience_level = 'EN'
GROUP BY company_location, MarketAverage.market_avg
HAVING AVG(salary_in_usd) > MarketAverage.market_avg;

-- Countries paying the maximum average salary for each job title:
WITH RankedSalaries AS (
    SELECT 
        job_title, 
        employee_residence, 
        AVG(salary_in_usd) AS avg_salary,
        ROW_NUMBER() OVER(PARTITION BY job_title ORDER BY AVG(salary_in_usd) DESC) AS rn
    FROM Salaries
    GROUP BY job_title, employee_residence
)
SELECT job_title, employee_residence
FROM RankedSalaries
WHERE rn = 1;

-- Countries with sustained salary growth over three years:
WITH Salary2021 AS (
    SELECT company_location, AVG(salary_in_usd) AS avg_salary_2021
    FROM Salaries
    WHERE work_year = 2021
    GROUP BY company_location
),
Salary2022 AS (
    SELECT company_location, AVG(salary_in_usd) AS avg_salary_2022
    FROM Salaries
    WHERE work_year = 2022
    GROUP BY company_location
),
Salary2023 AS (
    SELECT company_location, AVG(salary_in_usd) AS avg_salary_2023
    FROM Salaries
    WHERE work_year = 2023
    GROUP BY company_location
),
Growth AS (
    SELECT 
        s21.company_location,
        s22.avg_salary_2022 - s21.avg_salary_2021 AS growth_21_22,
        s23.avg_salary_2023 - s22.avg_salary_2022 AS growth_22_23
    FROM Salary2021 s21
    JOIN Salary2022 s22 ON s21.company_location = s22.company_location
    JOIN Salary2023 s23 ON s21.company_location = s23.company_location
)
SELECT company_location
FROM Growth
WHERE growth_21_22 > 0 AND growth_22_23 > 0;

-- PERCENTAGE OF FULLY REMOTE WORK BY EXPERIENCE LEVEL (2021 VS 2024):
WITH Remote2021 AS (
    SELECT 
        experience_level, 
        SUM(CASE WHEN remote_ratio = 100 THEN 1 ELSE 0 END) * 100.0 / COUNT(*) AS remote_percentage_2021
    FROM Salaries
    WHERE work_year = 2021
    GROUP BY experience_level
),
Remote2024 AS (
    SELECT 
        experience_level, 
        SUM(CASE WHEN remote_ratio = 100 THEN 1 ELSE 0 END) * 100.0 / COUNT(*) AS remote_percentage_2024
    FROM Salaries
    WHERE work_year = 2024
    GROUP BY experience_level
)
SELECT 
    r21.experience_level, 
    r21.remote_percentage_2021, 
    r24.remote_percentage_2024
FROM Remote2021 r21
JOIN Remote2024 r24 ON r21.experience_level = r24.experience_level;

-- Average salary increase percentage by experience level and job title (2023 to 2024):
WITH Salary2023 AS (
    SELECT experience_level, job_title, AVG(salary_in_usd) AS avg_salary_2023
    FROM Salaries
    WHERE work_year = 2023
    GROUP BY experience_level, job_title
),
Salary2024 AS (
    SELECT experience_level, job_title, AVG(salary_in_usd) AS avg_salary_2024
    FROM Salaries
    WHERE work_year = 2024
    GROUP BY experience_level, job_title
)
SELECT 
    s23.experience_level, 
    s23.job_title, 
    ((s24.avg_salary_2024 - s23.avg_salary_2023) * 100.0 / s23.avg_salary_2023) AS salary_increase_percentage
FROM Salary2023 s23
JOIN Salary2024 s24 ON s23.experience_level = s24.experience_level AND s23.job_title = s24.job_title;

-- Role-based access control for employees based on experience level:
-- (This is a conceptual example, as actual implementation depends on your database system and access control mechanisms)

-- Example: Selecting data for 'MI' experience level employees:
SELECT *
FROM Salaries
WHERE experience_level = 'MI';

-- In a real system, you would integrate this with user authentication and authorization.

-- Guiding clients in switching domains based on salary insights:
-- (This is a conceptual example, as it requires complex analysis and domain knowledge)

-- Example: Identifying job titles with higher average salaries in 2024:
WITH AvgSalaries2024 AS (
    SELECT job_title, AVG(salary_in_usd) AS avg_salary_2024
    FROM Salaries
    WHERE work_year = 2024
    GROUP BY job_title
)
SELECT job_title, avg_salary_2024
FROM AvgSalaries2024
ORDER BY avg_salary_2024 DESC
LIMIT 10;

-- You would then use this information to create recommendations, taking into account the employee's current skills and experience.
