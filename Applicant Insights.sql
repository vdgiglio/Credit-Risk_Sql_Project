SELECT COUNT(*) * 1.0 / (SELECT COUNT(*) FROM Applicants) AS Low_DTI
FROM Applicants
WHERE Debt_To_Income < 0.25;

SELECT
	CASE
    WHEN age BETWEEN 18 AND 25 THEN "18-25"
    WHEN age BETWEEN 26 AND 35 THEN "26-35"
    WHEN age BETWEEN 36 AND 45 THEN "36-45"
    WHEN age BETWEEN 46 AND 55 THEN "46-55"
    ELSE "Not Included"
    END AS Age_Group,
    AVG(Annual_Income) AS Average_Income
    FROM Applicants
    GROUP BY Age_Group;
    
SELECT
	CASE
    WHEN CREDIT_Score BETWEEN 550 AND 600 THEN "High Risk User"
    WHEN Credit_Score BETWEEN 600 AND 650 THEN "Moderate Risk User"
    WHEN Credit_Score BETWEEN 650 AND 700 THEN "Slight Risk User"
    WHEN Credit_Score BETWEEN 700 AND 750 THEN "Moderate User"
    WHEN Credit_Score BETWEEN 750 AND 800 THEN "Great User"
    WHEN Credit_Score BETWEEN 800 AND 850 THEN "Excellent User"
    END As Credit_Score_Category,
    COUNT(Applicant_ID) AS Number_Of_Users
    FROM Applicants
    GROUP BY Credit_Score_Category
    ORDER BY Number_Of_Users DESC;
    
SELECT Debt_To_Income
FROM Applicants
ORDER BY Debt_To_Income DESC
LIMIT 20;

SELECT 
	CASE 
    WHEN Approval_Status IS NULL THEN "Declined"
    ELSE Approval_Status
    END AS Approval_Status,
    AVG(Annual_Income) AS Average_Income
FROM Applicants
LEFT JOIN Applications
ON Applicants.Applicant_ID = Applications.Applicant_ID
GROUP BY Approval_Status;

SELECT 
	CASE 
    WHEN Approval_Status IS NULL THEN "Declined"
    ELSE Approval_Status
    END AS Approval_Status,
    AVG(Credit_Score) AS Average_Credit_Score
FROM Applicants
LEFT JOIN Applications
ON Applicants.Applicant_ID = Applications.Applicant_ID
GROUP BY Approval_Status;

SELECT Applicant_ID
FROM Applicants
WHERE Annual_Income > 110000 AND Credit_Score > 750