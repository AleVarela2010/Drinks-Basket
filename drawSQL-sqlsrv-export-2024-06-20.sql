CREATE TABLE "InvoicePurchase"(
    "IDInvoicePurchase" INT NOT NULL,
    "VendorNumber" INT NOT NULL,
    "PONumber" INT NOT NULL,
    "PayDate" DATE NOT NULL,
    "Quantity" INT NOT NULL,
    "Dollars" FLOAT(53) NOT NULL,
    "Freight" FLOAT(53) NOT NULL
);
ALTER TABLE
    "InvoicePurchase" ADD CONSTRAINT "invoicepurchase_idinvoicepurchase_primary" PRIMARY KEY("IDInvoicePurchase");
CREATE TABLE "Inventory"(
    "Brand" NVARCHAR(255) NOT NULL,
    "City" NVARCHAR(255) NOT NULL,
    "Store" INT NOT NULL,
    "Description" NVARCHAR(255) NOT NULL,
    "Size" NVARCHAR(255) NOT NULL,
    "onHand" INT NOT NULL,
    "Price" FLOAT(53) NOT NULL,
    "StartDate" DATE NOT NULL
);
ALTER TABLE
    "Inventory" ADD CONSTRAINT "inventory_brand_primary" PRIMARY KEY("Brand");
CREATE TABLE "Suppliers"(
    "VendorNumber" INT NOT NULL,
    "VendorName" NVARCHAR(255) NOT NULL
);
ALTER TABLE
    "Suppliers" ADD CONSTRAINT "suppliers_vendornumber_primary" PRIMARY KEY("VendorNumber");
CREATE TABLE "Sales"(
    "IDSales" INT NOT NULL,
    "Store" INT NOT NULL,
    "Brand" NVARCHAR(255) NOT NULL,
    "Size" NVARCHAR(255) NOT NULL,
    "SalesQuantity" INT NOT NULL,
    "SalesDollars" FLOAT(53) NOT NULL,
    "SalesPrice" FLOAT(53) NOT NULL,
    "ExciseTax" FLOAT(53) NOT NULL
);
ALTER TABLE
    "Sales" ADD CONSTRAINT "sales_idsales_primary" PRIMARY KEY("IDSales");
CREATE TABLE "Purchases"(
    "IDPurchases" INT NOT NULL,
    "IDInvoicePurchases" INT NOT NULL,
    "Brand" NVARCHAR(255) NOT NULL,
    "VendorNumer" INT NOT NULL,
    "PONumber" INT NOT NULL,
    "InvoiceDate" DATE NOT NULL,
    "PayDate" DATE NOT NULL,
    "PurchasePrice" FLOAT(53) NOT NULL,
    "Quantity" INT NOT NULL,
    "Dollars" FLOAT(53) NOT NULL,
    "Classification" INT NOT NULL
);
ALTER TABLE
    "Purchases" ADD CONSTRAINT "purchases_idpurchases_primary" PRIMARY KEY("IDPurchases");
CREATE TABLE "EndInvFinal"(
    "index" INT NOT NULL,
    "Brand" NVARCHAR(255) NOT NULL,
    "Store" INT NOT NULL,
    "City" NVARCHAR(255) NOT NULL,
    "InventoryId1" INT NOT NULL,
    "Description" NVARCHAR(255) NOT NULL,
    "Size" NVARCHAR(255) NOT NULL,
    "onHand" INT NOT NULL,
    "Price" FLOAT(53) NOT NULL,
    "endDate" DATE NOT NULL,
    "column_11" BIGINT NOT NULL
);
ALTER TABLE
    "EndInvFinal" ADD CONSTRAINT "endinvfinal_index_primary" PRIMARY KEY("index");
ALTER TABLE
    "Purchases" ADD CONSTRAINT "purchases_idinvoicepurchases_foreign" FOREIGN KEY("IDInvoicePurchases") REFERENCES "InvoicePurchase"("IDInvoicePurchase");
ALTER TABLE
    "InvoicePurchase" ADD CONSTRAINT "invoicepurchase_vendornumber_foreign" FOREIGN KEY("VendorNumber") REFERENCES "Suppliers"("VendorNumber");
ALTER TABLE
    "Sales" ADD CONSTRAINT "sales_idsales_foreign" FOREIGN KEY("IDSales") REFERENCES "Inventory"("Brand");
ALTER TABLE
    "EndInvFinal" ADD CONSTRAINT "endinvfinal_brand_foreign" FOREIGN KEY("Brand") REFERENCES "Inventory"("Brand");
ALTER TABLE
    "Purchases" ADD CONSTRAINT "purchases_idpurchases_foreign" FOREIGN KEY("IDPurchases") REFERENCES "Inventory"("Brand");