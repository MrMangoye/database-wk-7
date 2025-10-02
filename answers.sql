-- Transform ProductDetail table to First Normal Form (1NF)
-- Each product is split into its own row

SELECT 
    OrderID,
    CustomerName,
    TRIM(value) AS Product
FROM 
    ProductDetail
CROSS APPLY 
    STRING_SPLIT(Products, ',');

    -- Create OrderInfo table to store customer details
-- Each customer is linked to their OrderID

SELECT DISTINCT 
    OrderID, 
    CustomerName
INTO 
    OrderInfo
FROM 
    OrderDetails;

    -- Create OrderItems table to store product and quantity
-- This ensures all non-key attributes depend on the full composite key (OrderID, Product)

SELECT 
    OrderID, 
    Product, 
    Quantity
INTO 
    OrderItems
FROM 
    OrderDetails;