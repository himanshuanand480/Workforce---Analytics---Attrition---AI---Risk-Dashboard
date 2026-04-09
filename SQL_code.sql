CREATE DATABASE workforce_db;
USE workforce_db;
DROP table employee_data;
CREATE TABLE employee_data (
    Employee_ID INT,
    Age INT,
    Department VARCHAR(50),
    Salary INT,
    Working_Hours INT,
    Work_Life_Balance INT,
    Job_Satisfaction INT,
    Experience INT,
    Attrition VARCHAR(10));
    
SHOW TABLES;
    
SELECT * FROM employee_data;
    
CREATE TABLE job_data (
    Job_ID INT,
    Required_Skill VARCHAR(50),
    Experience_Required INT
);

SELECT * FROM job_data;



SELECT Attrition, COUNT(*) AS Total
FROM employee_data
GROUP BY Attrition;


SELECT Attrition, COUNT(*) AS Total
FROM employee_data
GROUP BY Attrition;

SELECT 
    (SUM(CASE WHEN Attrition = 'Yes' THEN 1 ELSE 0 END) * 100.0) / COUNT(*) AS Attrition_Rate
FROM employee_data;

SELECT Department, COUNT(*) AS Attrition_Count
FROM employee_data
WHERE Attrition = 'Yes'
GROUP BY Department;

SELECT Attrition, AVG(Salary) AS Avg_Salary
FROM employee_data
GROUP BY Attrition;

SELECT Working_Hours, Attrition, COUNT(*) 
FROM employee_data
GROUP BY Working_Hours, Attrition;

SELECT Job_Satisfaction, Attrition, COUNT(*) 
FROM employee_data
GROUP BY Job_Satisfaction, Attrition;

SELECT Required_Skill, COUNT(*) AS Demand
FROM job_data
GROUP BY Required_Skill
ORDER BY Demand DESC;



SELECT COUNT(*) FROM employee_data;
SELECT COUNT(*) FROM job_data;

SELECT 
    COUNT(*) AS Total_Employees,
    SUM(CASE WHEN Attrition = 'Yes' THEN 1 ELSE 0 END) AS Attrition_Count
FROM employee_data;

SELECT 
    ROUND(
        SUM(CASE WHEN Attrition = 'Yes' THEN 1 ELSE 0 END) * 100.0 / COUNT(*), 
    2) AS Attrition_Rate
FROM employee_data;


SELECT 
    Domain,
    COUNT(*) AS Total,
    SUM(CASE WHEN Attrition = 'Yes' THEN 1 ELSE 0 END) AS Attrition_Count
FROM employee_data
GROUP BY Domain
ORDER BY Attrition_Count DESC;

SELECT 
    Job_Satisfaction,
    COUNT(*) AS Total,
    SUM(CASE WHEN Attrition = 'Yes' THEN 1 ELSE 0 END) AS Attrition_Count
FROM employee_data
GROUP BY Job_Satisfaction
ORDER BY Job_Satisfaction;

SELECT 
    Required_Skill,
    COUNT(*) AS Demand
FROM job_data
GROUP BY Required_Skill
ORDER BY Demand DESC;

SELECT e.Domain, j.Rrquired_Skill FROM employee_data
JOIN job_data j 
ON e.Experience = j.Experience_Required;

