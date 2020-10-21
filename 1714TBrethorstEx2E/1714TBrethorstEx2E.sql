-- Tanner Brethorst
-- 1714 Ex.2E
-- Property Management tb

-- 2E.1 Building Name and Location

SELECT        BuildingName, Address, City + N',' + N' ' + State + N' ' + Zip AS Location
FROM            Building
WHERE        (City = N'Winona')

-- 2E.2 Apartment Estimated Rent
SELECT        Building.BuildingName, Apartment.ApartmentNum, Apartment.SquareFeet * .9 + Apartment.Bathrooms * 100 AS [Estimated Rent]
FROM            Building INNER JOIN
                         Apartment ON Building.BuildingId = Apartment.BuildingId
WHERE        (Building.City = N'Red Wing')

--2E.3 Estimated Vs. Actual Rent
SELECT        Building.BuildingName, Apartment.ApartmentNum, Apartment.Rent, Apartment.SquareFeet * 0.9 + Apartment.Bathrooms * 100 AS [Estimated Rent], Apartment.Rent - (Apartment.SquareFeet * .9 + Apartment.Bathrooms * 100) 
                         AS Difference
FROM            Building INNER JOIN
                         Apartment ON Building.BuildingId = Apartment.BuildingId
WHERE        (Building.City = N'Red Wing')

-- 2E.4 Invoice Total
SELECT        Apartment.BuildingId, Apartment.ApartmentNum, Person.FirstName + N' ' + Person.LastName AS [Full Name], Invoice.InvoiceDate, SUM(LineItem.Amount) AS Expr1
FROM            Apartment INNER JOIN
                         Person ON Apartment.TenantId = Person.PersonId INNER JOIN
                         Invoice ON Apartment.ApartmentId = Invoice.ApartmentId INNER JOIN
                         LineItem ON Invoice.InvoiceId = LineItem.InvoiceId
GROUP BY Apartment.BuildingId, Apartment.ApartmentNum, Person.FirstName + N' ' + Person.LastName, Invoice.InvoiceDate

-- 2E.5 Invoice Total and Receipt
SELECT        Apartment.BuildingId, Apartment.ApartmentNum, Person.FirstName + N' ' + Person.LastName AS FullName, Invoice.InvoiceDate, SUM(LineItem.Amount) AS [Invoice Total], Receipt.Amount AS [Receipt Total]
FROM            Apartment INNER JOIN
                         Person ON Apartment.TenantId = Person.PersonId INNER JOIN
                         Invoice ON Apartment.ApartmentId = Invoice.ApartmentId INNER JOIN
                         LineItem ON Invoice.InvoiceId = LineItem.InvoiceId INNER JOIN
                         Receipt ON Invoice.InvoiceId = Receipt.InvoiceId
GROUP BY Apartment.BuildingId, Apartment.ApartmentNum, Person.FirstName + N' ' + Person.LastName, Invoice.InvoiceDate, Receipt.Amount

-- 2E.6 Invoice Total Vs. Received
SELECT        Apartment.BuildingId, Apartment.ApartmentNum, Person.FirstName + N' ' + Person.LastName AS [Full Name], Invoice.InvoiceDate, SUM(LineItem.Amount) AS [Invoice Total], Receipt.Amount AS Received, SUM(LineItem.Amount) 
                         - Receipt.Amount AS Difference
FROM            Apartment INNER JOIN
                         Person ON Apartment.TenantId = Person.PersonId INNER JOIN
                         Invoice ON Apartment.ApartmentId = Invoice.ApartmentId INNER JOIN
                         LineItem ON Invoice.InvoiceId = LineItem.InvoiceId INNER JOIN
                         Receipt ON Invoice.InvoiceId = Receipt.InvoiceId
GROUP BY Apartment.BuildingId, Apartment.ApartmentNum, Person.FirstName + N' ' + Person.LastName, Invoice.InvoiceDate, Receipt.Amount
HAVING        (SUM(LineItem.Amount) - Receipt.Amount > 0)

-- 2E.7 Late Payments
SELECT        Apartment.BuildingId, Apartment.ApartmentNum, Person.FirstName + N' ' + Person.LastName AS [Full Name], Invoice.DueDate, Receipt.ReceiptDate, DATEDIFF(DAY, Invoice.DueDate, Receipt.ReceiptDate) AS [Days Late]
FROM            Apartment INNER JOIN
                         Person ON Apartment.TenantId = Person.PersonId INNER JOIN
                         Invoice ON Apartment.ApartmentId = Invoice.ApartmentId INNER JOIN
                         Receipt ON Invoice.InvoiceId = Receipt.InvoiceId
WHERE        (DATEDIFF(DAY, Invoice.DueDate, Receipt.ReceiptDate) > 0)

-- 2E.8 Next Invoice Date
SELECT        Person.PersonId, Person.FirstName + N' ' + Person.LastName AS [Full Name], MAX(Invoice.InvoiceDate) AS [Recent Invoice], DATEADD(Month, 1, MAX(Invoice.InvoiceDate)) AS Expr1
FROM            Apartment INNER JOIN
                         Person ON Apartment.TenantId = Person.PersonId INNER JOIN
                         Invoice ON Apartment.ApartmentId = Invoice.ApartmentId
GROUP BY Person.PersonId, Person.FirstName + N' ' + Person.LastName