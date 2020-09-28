-- Tanner Brethorst
-- Exercise 2A: Two Table Quereis
-- PropertyManager db

-- 2A.1) Building, Apartment Tables. Sort by BuildingId and ApartmentNum
SELECT        Building.BuildingId, Building.BuildingName, Apartment.ApartmentNum, Apartment.Rent
FROM            Building INNER JOIN
                         Apartment ON Building.BuildingId = Apartment.BuildingId
ORDER BY Building.BuildingId, Apartment.ApartmentNum
-- 2A.2) Building, Apartment Tables. Sort by BuildingId and Rent. Filter Winona
SELECT        Building.BuildingId, Building.City, Building.BuildingName, Apartment.ApartmentNum, Apartment.Rent
FROM            Building INNER JOIN
                         Apartment ON Building.BuildingId = Apartment.BuildingId
WHERE        (Building.City = N'Winona')
ORDER BY Building.BuildingId, Apartment.Rent DESC
-- 2A.3 Apartment, Invoice Tables. Sort by ApartmentNum and InvoiceDate. Filter BuildingId 1
SELECT        Apartment.ApartmentId, Apartment.ApartmentNum, Invoice.InvoiceId, Invoice.InvoiceDate, Invoice.DueDate
FROM            Apartment INNER JOIN
                         Invoice ON Apartment.ApartmentId = Invoice.ApartmentId
WHERE        (Apartment.BuildingId = 1)
ORDER BY Apartment.ApartmentNum, Invoice.InvoiceDate DESC
-- 2A.4 Apartment, Invoice Tables. Sort by BuildingId and ApartmentNum 
SELECT        Apartment.BuildingId, Apartment.ApartmentNum, Invoice.InvoiceId, Invoice.InvoiceDate, Invoice.DueDate
FROM            Apartment INNER JOIN
                         Invoice ON Apartment.ApartmentId = Invoice.ApartmentId
ORDER BY Apartment.BuildingId, Apartment.ApartmentNum DESC
-- 2A.5 Apartment, Person Tables. Sort by BuildingId and ApartmentNumb
SELECT        Apartment.BuildingId, Apartment.ApartmentNum, Apartment.Rent, Person.LastName AS Admin
FROM            Apartment INNER JOIN
                         Person ON Apartment.AdminId = Person.PersonId
ORDER BY Apartment.BuildingId, Apartment.ApartmentNum
-- 2A.6 Apartment, Person Tables. Sort by BuildingId, TenantLastName, TenantFirstName
SELECT        Apartment.BuildingId, Apartment.ApartmentNum, Person.LastName, Person.FirstName
FROM            Apartment INNER JOIN
                         Person ON Apartment.TenantId = Person.PersonId
ORDER BY Apartment.BuildingId, Person.LastName, Person.FirstName
-- 2A.7 Invoice, LineItem Tables. Sort by ApartmentId and InvoiceDate
SELECT        Invoice.ApartmentId, LineItem.InvoiceId, Invoice.InvoiceDate, LineItem.Description, LineItem.Amount
FROM            Invoice INNER JOIN
                         LineItem ON Invoice.InvoiceId = LineItem.InvoiceId
ORDER BY Invoice.ApartmentId, LineItem.InvoiceId DESC
-- 2A.8 Invoice, LineItem Tables. Sort by ApartmentId and InvoiceDate. Filter Rent and Garage
SELECT        Invoice.ApartmentId, LineItem.InvoiceId, Invoice.InvoiceDate, LineItem.Description, LineItem.Amount
FROM            Invoice INNER JOIN
                         LineItem ON Invoice.InvoiceId = LineItem.InvoiceId
WHERE        (LineItem.Description = N'Rent' AND LineItem.Description = N'Garage')
ORDER BY Invoice.ApartmentId, LineItem.InvoiceId DESC
-- 2A.9 Invoice, Receipt Tables. Sort by ApartmentId and InvoiceId
SELECT        Invoice.ApartmentId, Receipt.InvoiceId, Invoice.DueDate, Receipt.ReceiptDate, Receipt.Amount
FROM            Invoice INNER JOIN
                         Receipt ON Invoice.InvoiceId = Receipt.InvoiceId
ORDER BY Invoice.ApartmentId, Receipt.InvoiceId