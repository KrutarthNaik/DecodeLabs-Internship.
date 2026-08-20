CREATE DATABASE IF NOT EXISTS data_analytics_project3;
USE data_analytics_project3;

DROP TABLE IF EXISTS orders;

CREATE TABLE orders (
    OrderID VARCHAR(20),
    Date DATE,
    CustomerID VARCHAR(20),
    Product VARCHAR(50),
    Quantity INT,
    UnitPrice DECIMAL(10,2),
    ShippingAddress VARCHAR(255),
    PaymentMethod VARCHAR(50),
    OrderStatus VARCHAR(30),
    TrackingNumber VARCHAR(50),
    ItemsInCart INT,
    CouponCode VARCHAR(30),
    ReferralSource VARCHAR(50),
    TotalPrice DECIMAL(12,2)
);

-- Import the uploaded CSV in MySQL Workbench.
-- Adjust the LOCAL INFILE path to your computer if required.
LOAD DATA LOCAL INFILE 'Dataset for Data Analytics(2).csv'
INTO TABLE orders
FIELDS TERMINATED BY ','
OPTIONALLY ENCLOSED BY '"'
LINES TERMINATED BY '\n'
IGNORE 1 ROWS;

-- 1. SELECT: display basic order information
SELECT OrderID, Date, Product, Quantity, TotalPrice
FROM orders
LIMIT 10;

-- 2. WHERE: filter delivered orders
SELECT OrderID, CustomerID, Product, TotalPrice
FROM orders
WHERE OrderStatus = 'Delivered';

-- 3. ORDER BY: highest-value orders
SELECT OrderID, Product, Quantity, TotalPrice
FROM orders
ORDER BY TotalPrice DESC
LIMIT 10;

-- 4. COUNT: total number of orders
SELECT COUNT(*) AS Total_Orders
FROM orders;

-- 5. SUM: total sales
SELECT ROUND(SUM(TotalPrice), 2) AS Total_Sales
FROM orders;

-- 6. AVG: average order value
SELECT ROUND(AVG(TotalPrice), 2) AS Average_Order_Value
FROM orders;

-- 7. GROUP BY: sales and order volume by product
SELECT Product,
       COUNT(*) AS Order_Count,
       SUM(Quantity) AS Total_Quantity,
       ROUND(SUM(TotalPrice), 2) AS Total_Sales,
       ROUND(AVG(TotalPrice), 2) AS Average_Sale
FROM orders
GROUP BY Product
ORDER BY Total_Sales DESC;

-- 8. GROUP BY: order status analysis
SELECT OrderStatus,
       COUNT(*) AS Order_Count,
       ROUND(SUM(TotalPrice), 2) AS Total_Sales,
       ROUND(AVG(TotalPrice), 2) AS Average_Order
FROM orders
GROUP BY OrderStatus
ORDER BY Order_Count DESC;

-- 9. GROUP BY: payment method analysis
SELECT PaymentMethod,
       COUNT(*) AS Order_Count,
       ROUND(SUM(TotalPrice), 2) AS Total_Sales
FROM orders
GROUP BY PaymentMethod
ORDER BY Total_Sales DESC;

-- 10. GROUP BY: referral source analysis
SELECT ReferralSource,
       COUNT(*) AS Order_Count,
       ROUND(SUM(TotalPrice), 2) AS Total_Sales,
       ROUND(AVG(TotalPrice), 2) AS Average_Order
FROM orders
GROUP BY ReferralSource
ORDER BY Total_Sales DESC;

-- 11. WHERE + ORDER BY: high-value orders above 2000
SELECT OrderID, Product, PaymentMethod, OrderStatus, TotalPrice
FROM orders
WHERE TotalPrice > 2000
ORDER BY TotalPrice DESC;

-- 12. HAVING: products with sales above 160000
SELECT Product,
       ROUND(SUM(TotalPrice), 2) AS Total_Sales
FROM orders
GROUP BY Product
HAVING SUM(TotalPrice) > 160000
ORDER BY Total_Sales DESC;

-- 13. GROUP BY: coupon-code analysis, including NULL as No Coupon
SELECT COALESCE(CouponCode, 'No Coupon') AS Coupon,
       COUNT(*) AS Order_Count,
       ROUND(SUM(TotalPrice), 2) AS Total_Sales
FROM orders
GROUP BY COALESCE(CouponCode, 'No Coupon')
ORDER BY Total_Sales DESC;

-- 14. COUNT: orders without a coupon
SELECT COUNT(*) AS No_Coupon_Orders
FROM orders
WHERE CouponCode IS NULL;

-- 15. Monthly sales analysis (MySQL)
SELECT DATE_FORMAT(Date, '%Y-%m') AS Month,
       COUNT(*) AS Order_Count,
       ROUND(SUM(TotalPrice), 2) AS Total_Sales
FROM orders
GROUP BY DATE_FORMAT(Date, '%Y-%m')
ORDER BY Total_Sales DESC;
