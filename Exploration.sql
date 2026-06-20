SELECT Count(*)
FROM Applicants;

SELECT Count(*)
FROM Applications;

SELECT Count(*)
FROM Payments;

SELECT Count(*)
FROM Transactions;

SELECT AVG(Annual_Income)
FROM Applicants;

SELECT AVG(Debt_To_Income)
FROM Applicants;

SELECT MIN(Credit_Score), MAX(Credit_Score)
FROM Applicants;

SELECT Approval_Status, COUNT(*) As Total_Applications
FROM Applications
GROUP BY Approval_Status;

SELECT Card_Product, COUNT(*) AS Unique_Cards
FROM Applications
GROUP BY Card_Product;

SELECT COUNT(was_late)
FROM Payments
WHERE was_late = "YES"