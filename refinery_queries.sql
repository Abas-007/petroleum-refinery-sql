-- QUERY 1: List all products and their inventory quantities
SELECT p.Name AS Product, i.Quantity_Available, i.Last_Updated
FROM Products p
JOIN Inventory i ON p.ProductID = i.ProductID;

-- QUERY 2: Total inventory value (Quantity × Price)
SELECT 
    p.Name AS Product,
    i.Quantity_Available,
    p.Price_Per_Unit,
    (i.Quantity_Available * p.Price_Per_Unit) AS Inventory_Value
FROM Inventory i
JOIN Products p ON i.ProductID = p.ProductID;

-- QUERY 3: Top 2 products by inventory quantity
SELECT p.Name AS Product, i.Quantity_Available
FROM Inventory i
JOIN Products p ON i.ProductID = p.ProductID
ORDER BY i.Quantity_Available DESC
LIMIT 2;

-- QUERY 4: Total quantity of crude oil used in production
SELECT 
    r.Name AS RawMaterial,
    SUM(p.Quantity_Used) AS Total_Used
FROM Production p
JOIN RawMaterials r ON p.RawMaterialID = r.MaterialID
WHERE r.Name = 'Crude Oil';

-- QUERY 5: Products produced today (using CURDATE)
SELECT pr.Name AS Product, pd.Quantity_Produced, pd.Production_Date
FROM Production pd
JOIN Products pr ON pd.ProductID = pr.ProductID
WHERE pd.Production_Date = CURDATE();

-- QUERY 6: Raw materials and total quantities supplied
SELECT rm.Name AS Material, SUM(s.Quantity_Supplied) AS Total_Supplied
FROM Supply s
JOIN RawMaterials rm ON s.MaterialID = rm.MaterialID
GROUP BY rm.Name;

-- QUERY 7: Suppliers who have supplied crude oil
SELECT DISTINCT sup.Name AS Supplier, rm.Name AS Material
FROM Supply s
JOIN Suppliers sup ON s.SupplierID = sup.SupplierID
JOIN RawMaterials rm ON s.MaterialID = rm.MaterialID
WHERE rm.Name = 'Crude Oil';

-- QUERY 8: Average quantity produced per product
SELECT pr.Name AS Product, AVG(pd.Quantity_Produced) AS Average_Production
FROM Production pd
JOIN Products pr ON pd.ProductID = pr.ProductID
GROUP BY pr.Name;

-- QUERY 9: Products that have not been produced today
SELECT p.Name
FROM Products p
WHERE p.ProductID NOT IN (
    SELECT ProductID
    FROM Production
    WHERE Production_Date = CURDATE()
);

-- QUERY 10: Quantity of each raw material used in production
SELECT rm.Name AS RawMaterial, SUM(p.Quantity_Used) AS Total_Used
FROM Production p
JOIN RawMaterials rm ON p.RawMaterialID = rm.MaterialID
GROUP BY rm.Name;
