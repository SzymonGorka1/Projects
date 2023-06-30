
--1-------------------------------------------------------------------------

WITH TempEmployeeInfo (Rate, FirstName, LastName)  
AS  
-- Definicja zapytania CTE. 
(  
    SELECT Rate, FirstName, LastName
    FROM Person.Person
	JOIN HumanResources.EmployeePayHistory 
	ON  Person.Person.BusinessEntityID = EmployeePayHistory.BusinessEntityID
    WHERE Rate IS NOT NULL  
)  
-- Definicja zapytania zewnêtrznego, które bazuje na CTE.
SELECT Rate, FirstName, LastName  
FROM TempEmployeeInfo ; 

Select * From Person.Person;
Select * From HumanResources.EmployeePayHistory;

--2--------------------------------------------------------------------------------------


SELECT * FROM SalesLT.Customer;
SELECT * FROM SalesLT.SalesOrderHeader;

Select CustomerID FROM SalesLT.Customer
WHERE FirstName = 'Terry';

SELECT TotalDue FROM SalesLT.SalesOrderHeader WHERE CustomerID = 29736;

WITH cwiczenie2 (CompanyContact, Revenue )
AS  
-- Definicja zapytania CTE. 
(  
    SELECT CompanyName + ' (' + FirstName  + ' ' + LastName + ')' AS CompanyContact, TotalDue AS Revenue
    FROM SalesLT.Customer
	JOIN SalesLT.SalesOrderHeader 
	ON  SalesLT.SalesOrderHeader.CustomerID = SalesLT.Customer.CustomerID
     
)  
-- Definicja zapytania zewnêtrznego, które bazuje na CTE.
SELECT *  
FROM cwiczenie2
ORDER BY CompanyContact;



--3--------------------------------------------------------------------------------------------------



SELECT * FROM SalesLT.ProductCategory WHERE Name = 'Bike Racks';
SELECT * FROM SalesLT.Product WHERE ProductCategoryID = 30;
SELECT SUM(LineTotal) FROM SalesLT.SalesOrderDetail WHERE ProductID = 876;



WITH cwiczenie3 (Category, SalesValue)
AS
(
SELECT ProductCategory.Name AS Category, ROUND(SUM(LineTotal),2) AS SalesValue
FROM SalesLT.ProductCategory
JOIN SalesLT.Product
ON SalesLT.Product.ProductCategoryID = SalesLT.ProductCategory.ProductCategoryID
JOIN SalesLT.SalesOrderDetail
ON SalesLT.SalesOrderDetail.ProductID = SalesLT.Product.ProductID
GROUP BY ProductCategory.Name
)

SELECT * FROM cwiczenie3
ORDER BY Category;