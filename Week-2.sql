--Ques: 1 Find all the tracks that have a length of 5,000,000 milliseconds or more.

SELECT Name FROM Tracks
WHERE Milliseconds >= 5000000;


--Ques: 2 Find all the invoices whose total is between $5 and $15 dollars.

SELECT InvoiceId FROM Invoices
WHERE Total BETWEEN 5 AND 15;

-- Ques: 3 Find all the customers from the following States: RJ, DF, AB, BC, CA, WA, NY.

SELECT FirstName, LastName, Company FROM Customers
WHERE FirstName = 'Jack';

--Ques: 4 Find all the invoices for customer 56 and 58 where the total was between $1.00 and $5.00.

SELECT * FROM Invoices
WHERE (CustomerId = '56' OR CustomerId = '58') AND (Total BETWEEN 1 AND 5);

--Ques: 5 Find all the tracks whose name starts with 'All'.

SELECT Name FROM Tracks
WHERE Name LIKE 'All%';

--Ques: 6 Find all the customer emails that start with "J" and are from gmail.com.

SELECT Email FROM Customers
WHERE Email LIKE 'J%gmail.com';

--Ques: 7 Find all the invoices from the billing city Brasília, Edmonton, and Vancouver and sort in descending order by invoice ID.

SELECT * FROM Invoices 
WHERE (BillingCity = 'Brasília')
OR (BillingCity = 'Edmonton')
OR (BillingCity = 'Vancouver')
ORDER BY InvoiceId DESC;

--Ques: 8 Show the number of orders placed by each customer 
--(hint: this is found in the invoices table) and sort the result by the number of orders in descending order.

SELECT CustomerId, COUNT(InvoiceId)
FROM Invoices
GROUP BY CustomerId
ORDER BY COUNT(InvoiceId) DESC;

--Ques: 9 Find the albums with 12 or more tracks.

SELECT AlbumId, COUNT(TrackId)
FROM Tracks
GROUP BY AlbumId
HAVING COUNT(TrackId) >= 12;