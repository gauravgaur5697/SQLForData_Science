--Using a subquery, find the names of all the tracks for the album "Californication".

SELECT T.Name FROM Tracks T
WHERE T.AlbumId In (
    SELECT A.AlbumId FROM Albums A
    WHERE A.Title = 'Californication'
);

--Find the total number of invoices for each customer along with the customer's full name, city and email.

SELECT DISTINCT C.FirstName || ' ' || C.LastName AS FullName,
C.City, C.Email, COUNT(I.InvoiceId)
FROM Customers C, Invoices I
GROUP BY I.CustomerId;

--Retrieve the track name, album, artistID, and trackID for all the albums.

SELECT T.Name, A.Title, A.ArtistId, T.TrackId
FROM Tracks T, Albums A
WHERE T.AlbumId = A.AlbumId;

--Retrieve a list with the managers last name, and the last name of the employees who report to him or her.

SELECT M.LastName AS Manager, 
       E.LastName AS Employee
FROM Employees E INNER JOIN Employees M 
ON E.ReportsTo = M.EmployeeID;

--Find the name and ID of the artists who do not have albums. 

SELECT Name AS Artist,
       AR.ArtistId,
       A.Title AS Album
FROM Artists AR
LEFT JOIN Albums A
ON AR.ArtistId = A.ArtistId
WHERE Album IS NULL;

--Use a UNION to create a list of all the employee's and customer's first names and last names ordered by the last name in descending order.

SELECT FirstName,
       LastName
FROM Employees
UNION
SELECT FirstName,
       LastName
FROM Customers
ORDER BY LastName DESC;

--See if there are any customers who have a different city listed in their billing city versus their customer city.

SELECT C.FirstName,
       C.LastName,
       C.City AS CustomerCity,
       I.BillingCity
FROM Customers C
INNER JOIN Invoices I
ON C.CustomerId = I.CustomerId
WHERE CustomerCity != BillingCity