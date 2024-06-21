CREATE DATABASE DrinksBasket1

USE DrinksBasket1


CREATE TABLE "InvoicePurchase"(
    "IDInvoicePurchase" INT NOT NULL,
    "IDPurchases" INT NOT NULL,
    "VendorNumber" INT NOT NULL,
    "PayDate" DATE NOT NULL,
    "InvoiceDate" DATE NOT NULL,
    "Freight" FLOAT(53) NOT NULL,
    "PODate" DATE NOT NULL
);


CREATE TABLE "InventorySale"(
    "Brand" NVARCHAR(255) NOT NULL,
    "IDSales" INT NOT NULL
);

CREATE TABLE "Inventory"(
    "Brand" NVARCHAR(255) NOT NULL,
    "City" NVARCHAR(255) NOT NULL,
    "Store" INT NOT NULL,
    "Description" NVARCHAR(255) NOT NULL,
    "Size" NVARCHAR(255) NOT NULL,
    "onHand" INT NOT NULL,
    "Price" FLOAT(53) NOT NULL,
);


CREATE TABLE "Suppliers"(
    "VendorNumber" INT NOT NULL,
    "VendorName" NVARCHAR(255) NOT NULL
);

CREATE TABLE "Sale"(
    "IDSales" INT NOT NULL,
    "SalesDate" DATE NOT NULL,
    "Store" INT NOT NULL,
    "ExciseTax" FLOAT(53) NOT NULL
);

CREATE TABLE "SaleDetail"(
    "DetalilSalesID" VARCHAR(255) NOT NULL,
    "IDSales" INT NOT NULL,
    "Size" VARCHAR(255) NOT NULL,
    "Sales Quantity" INT NOT NULL,
    "SalesDollars" FLOAT(53) NOT NULL,
    "SalesPrice" FLOAT(53) NOT NULL
);

CREATE TABLE "Purchases"(
    "IDPurchases" INT NOT NULL,
    "Brand" NVARCHAR(255) NOT NULL,
    "PONumber" INT NOT NULL,
    "PurchasePrice" FLOAT(53) NOT NULL,
    "PODate" DATE NOT NULL,
    "ReceivingDate" DATE NOT NULL,
    "Quantity" INT NOT NULL,
    "Dollars" FLOAT(53) NOT NULL,
    "Classification" INT NOT NULL
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
ADD InventoryID INT IDENTITY(1,1) NOT NULL;

ALTER TABLE Inventory
ADD CONSTRAINT PK_Inventory PRIMARY KEY (InventoryID);


ALTER TABLE SaleDetail
ALTER COLUMN IDSales INT NOT NULL;

ALTER TABLE SaleDetail
ADD CONSTRAINT FK_SaleDetail_Sale
FOREIGN KEY (IDSales) REFERENCES Sale(IDSales);

ALTER TABLE InventorySale
ALTER COLUMN IDSales INT NOT NULL;

ALTER TABLE InventorySale
ADD CONSTRAINT FK_InventorySale_Sale_
FOREIGN KEY (IDSales) REFERENCES Sale(IDSales);

EXEC sp_rename 'InventorySale.Brand', 'InventoryID', 'COLUMN';


ALTER TABLE InventorySale
ALTER COLUMN InventoryID INT NOT NULL;

ALTER TABLE InventorySale
ADD CONSTRAINT FK_InventorySale_Inventory_
FOREIGN KEY (InventoryID) REFERENCES Inventory(InventoryID);

ALTER TABLE Purchases ADD InventoryID INT;


UPDATE Purchases
SET InventoryID = inv.InventoryID
FROM Purchases pur
JOIN Inventory inv ON pur.InventoryID = inv.InventoryID;

ALTER TABLE Purchases
ADD CONSTRAINT FK_Purchases_Inventory_
FOREIGN KEY (InventoryID) REFERENCES Inventory(InventoryID);

ALTER TABLE InvoicePurchase
ALTER COLUMN IDPurchases INT NOT NULL;

ALTER TABLE InvoicePurchase
ADD CONSTRAINT FK_InvoicePurchase_Purchases
FOREIGN KEY (IDPurchases) REFERENCES Purchases(IDPurchases);

ALTER TABLE InvoicePurchase
ALTER COLUMN VendorNumber INT NOT NULL;

ALTER TABLE InvoicePurchase
ADD CONSTRAINT FK_InvoicePurchase_Suppliers
FOREIGN KEY (VendorNumber) REFERENCES Suppliers(VendorNumber);