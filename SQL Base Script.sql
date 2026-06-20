SELECT Applicant_ID, Age, Annual_Income
FROM Applicants
WHERE Debt_To_Income < 0.25
ORDER BY Debt_To_Income DESC;

SELECT Applicant_ID, Card_Product, Assigned_Credit_Line
FROM Applications
WHERE Approval_Status = "Approved";




