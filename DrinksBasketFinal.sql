--Se crea la base de datos 
CREATE DATABASE DrinksBasket

-- Me posiciono en la nueva base de datos
USE DrinksBasket

-- Creo las tablas 
CREATE TABLE "InvoicePurchase"(
    "IDInvoicePurchase" INT NOT NULL,
    "IDPurchases" INT NOT NULL,
    "VendorNumber" INT NOT NULL,
    "PayDate" DATE NOT NULL,
    "InvoiceDate" DATE NOT NULL,
    "Freight" FLOAT(53) NOT NULL,
    "PODate" DATE NOT NULL
);

CREATE TABLE "Inventory"(
    "Brand" NVARCHAR(255) NOT NULL,
    "City" NVARCHAR(255) NOT NULL,
    "Store" INT NOT NULL,
    "Description" NVARCHAR(255) NOT NULL,
    "Size" NVARCHAR(255) NOT NULL,
    "onHand" INT NOT NULL,
    "Price" FLOAT(53) NOT NULL,
	"InventoryId" INT NOT NULL,
	"ProductoID" INT NOT NULL
);

CREATE TABLE "Suppliers"(
    "VendorNumber" INT NOT NULL,
    "VendorName" NVARCHAR(255) NOT NULL
);

CREATE TABLE "Sale"(
    "IDSales" INT NOT NULL,
    "SalesDate" DATE NOT NULL,
    "Store" INT NOT NULL,
    "ExciseTax" FLOAT(53) NOT NULL,
	"Brand" NVARCHAR(255) NOT NULL
);

CREATE TABLE "SaleDetail"(
    "DetalilSalesID" VARCHAR(255) NOT NULL,
    "IDSales" INT NOT NULL,
    "Size" VARCHAR(255) NOT NULL,
    "SalesQuantity" INT NOT NULL,
    "SalesDollars" FLOAT(53) NOT NULL,
    "SalesPrice" FLOAT(53) NOT NULL,
	"Brand" VARCHAR(255) NOT NULL,
	"Description" VARCHAR(255) NOT NULL,
);

CREATE TABLE "Purchases"(
    "IDPurchases" INT NOT NULL,
    "InventoryId" NVARCHAR(255) NOT NULL,
    "PONumber" INT NOT NULL,
    "PurchasePrice" FLOAT(53) NOT NULL,
    "PODate" DATE NOT NULL,
    "ReceivingDate" DATE NOT NULL,
    "Quantity" INT NOT NULL,
    "Dollars" FLOAT(53) NOT NULL,
    "Classification" INT NOT NULL,
	"Brand" INT NOT NULL
);

ALTER TABLE Purchases
ALTER COLUMN IDPurchases INT NOT NULL;

ALTER TABLE Purchases
ADD CONSTRAINT PK_Purchases PRIMARY KEY (IDPurchases);

ALTER TABLE SaleDetail
ALTER COLUMN DetailSalesID INT NOT NULL;

ALTER TABLE SaleDetail
ADD CONSTRAINT PK_DetailSalesID PRIMARY KEY (DetailSalesID);

ALTER TABLE Sale
ALTER COLUMN IDSales INT NOT NULL;

ALTER TABLE Sale
ADD CONSTRAINT PK_IDSales PRIMARY KEY (IDSales);

ALTER TABLE InvoicePurchase
ALTER COLUMN IDInvoicePurchases INT NOT NULL;

ALTER TABLE InvoicePurchase
ADD CONSTRAINT PK_IDInvoicePurchases PRIMARY KEY (IDInvoicePurchases);

ALTER TABLE Suppliers
ALTER COLUMN VendorNumber INT NOT NULL;

--Se eliminan los duplicados de Suppliers

SELECT *
FROM Suppliers
WHERE VendorNumber IN (SELECT VendorNumber FROM Suppliers GROUP BY VendorNumber HAVING COUNT(*) > 1);

WITH CTE AS (
    SELECT VendorNumber, 
           ROW_NUMBER() OVER (PARTITION BY VendorNumber ORDER BY (SELECT NULL)) AS rn
    FROM Suppliers
)
DELETE FROM CTE
WHERE rn > 1;

ALTER TABLE Suppliers
ADD CONSTRAINT PK_VendorNumber PRIMARY KEY (VendorNumber);



ALTER TABLE Inventory
ALTER COLUMN ProductoID INT NOT NULL;

ALTER TABLE Inventory
ADD CONSTRAINT PK_ProductoID PRIMARY KEY (ProductoID);








CREATE TABLE SaleInventory2 (
    IDSales INT,
    ProductoID INT,
    PRIMARY KEY (IDSales, ProductoID),
    FOREIGN KEY (IDSales) REFERENCES Sale(IDSales),
    FOREIGN KEY (ProductoID) REFERENCES Inventory(ProductoID)
);

Select * FROM SaleInventory2

-- Verifica las claves foráneas de la tabla SaleInventory2
EXEC sp_fkeys @pktable_name = 'Sale', @pktable_owner = 'dbo', @fktable_name = 'SaleInventory2';

EXEC sp_fkeys @pktable_name = 'Inventory', @pktable_owner = 'dbo', @fktable_name = 'SaleInventory2';


INSERT INTO SaleInventory2(IDSales, ProductoID)
SELECT s.IDSales, i.ProductoID
FROM Sale s
JOIN Inventory i ON s.Brand = i.Brand;

Select * FROM SaleInventory2
