SELECT 
	CASE
		WHEN Credit_Score BETWEEN 550 AND 600 THEN "Extremely Low Chance"
        WHEN Credit_Score BETWEEN 600 AND 650 THEN "Low Chance"
		WHEN Credit_Score BETWEEN 650 AND 700 THEN "Fair Chance"
		WHEN Credit_Score BETWEEN 700 AND 750 THEN "Great Chance"
        WHEN Credit_Score BETWEEN 750 AND 800 THEN "Excellent Chance"
		WHEN Credit_Score BETWEEN 800 AND 850 THEN "Auto-Accept"
			END AS Risk_Bucket,
	CASE 
		WHEN Approval_Status IS NULL THEN "Declined"
        ELSE Approval_Status
	END AS Final_Approval_Status,
	COUNT(*) AS Total_Applicants
	FROM Applicants
    LEFT JOIN Applications
		ON Applicants.Applicant_Id = Applications.Applicant_Id
	GROUP BY Risk_Bucket, Final_Approval_Status
    ORDER BY Final_Approval_Status;
    
    SELECT
		CASE
			WHEN Annual_Income BETWEEN 0 AND 40000 THEN "Low Income"
            WHEN Annual_Income BETWEEN 40000 AND 70000 THEN "Average Income"
            WHEN Annual_Income BETWEEN 70000 AND 100000 THEN "Great Income"
            WHEN Annual_Income BETWEEN 100000 AND 120000 THEN "Excellent Income"
            ELSE "Outstanding Income"
				END AS Income_Group,
        CASE
			WHEN Approval_Status IS NULL THEN "Declined"
            ELSE Approval_Status
		END AS Final_Approval_Status,
        COUNT(*) AS Total_Applicants
        FROM Applicants
        LEFT JOIN Applications
			ON Applicants.Applicant_Id = Applications.Applicant_Id
		GROUP BY Income_Group, Final_Approval_Status
        ORDER BY Total_Applicants DESC;

SELECT Card_Product, AVG(Assigned_Credit_Line)
FROM Applications
GROUP BY Card_Product;

SELECT Card_Product, MAX(Assigned_Credit_Line) AS Maximum_Credit_Line
FROM Applications
GROUP BY Card_Product
ORDER BY Maximum_Credit_Line DESC;

SELECT COUNT(*) AS Frequency, Assigned_Credit_Line
FROM Applications
GROUP BY Assigned_Credit_Line
ORDER BY Frequency DESC
LIMIT 1; 

SELECT Card_Product, COUNT(*) AS Frequency
FROM Applications
WHERE Approval_Status = "Approved"
GROUP BY Card_Product
ORDER BY Frequency DESC
LIMIT 1;

SELECT Credit_Score, AVG(Assigned_Credit_Line)
FROM Applications
	LEFT JOIN Applicants
    ON Applicants.Applicant_Id = Applications.Applicant_Id
WHERE Credit_Score > 700
GROUP BY Credit_Score
ORDER BY Credit_Score DESC;
