-- Products
INSERT INTO Products (Name, Description, Price_Per_Unit) VALUES
('Petrol', 'Refined petrol fuel', 650.00),
('Diesel', 'Diesel fuel', 720.00),
('Kerosene', 'Household kerosene', 500.00),
('Cooking Gas', 'Liquefied petroleum gas', 450.00);

-- Raw Materials
INSERT INTO RawMaterials (Name, Description, Unit_Cost) VALUES
('Crude Oil', 'Unrefined petroleum oil', 300.00),
('Additives', 'Fuel additives', 100.00);

-- Suppliers
INSERT INTO Suppliers (Name, Contact_Info) VALUES
('NNPC Ltd', 'nnpc@example.com'),
('Chevron Nigeria', 'chevron@example.com'),
('TotalEnergies', 'total@example.com');

-- Inventory
INSERT INTO Inventory (ProductID, Quantity_Available, Last_Updated) VALUES
(1, 15000.00, '2025-05-15'),
(2, 12000.00, '2025-05-15'),
(3, 8000.00, '2025-05-15'),
(4, 5000.00, '2025-05-15');

-- Production
INSERT INTO Production (ProductID, Quantity_Produced, RawMaterialID, Quantity_Used, Production_Date) VALUES
(1, 10000.00, 1, 13000.00, '2025-05-16'),
(2, 8000.00, 1, 10000.00, '2025-05-16'),
(3, 6000.00, 1, 7000.00, '2025-05-16'),
(4, 4000.00, 1, 5000.00, '2025-05-16'),
(1, 5000.00, 1, 6000.00, CURDATE());

-- Supply
INSERT INTO Supply (SupplierID, MaterialID, Quantity_Supplied, Supply_Date) VALUES
(1, 1, 20000.00, '2025-05-14'),
(2, 1, 15000.00, '2025-05-14'),
(3, 2, 5000.00, '2025-05-14');
