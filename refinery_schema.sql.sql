CREATE TABLE Products (
    ProductID INT PRIMARY KEY AUTO_INCREMENT,
    Name VARCHAR(100) NOT NULL,
    Description VARCHAR(255),
    Price_Per_Unit DECIMAL(10, 2) NOT NULL
);

CREATE TABLE RawMaterials (
    MaterialID INT PRIMARY KEY AUTO_INCREMENT,
    Name VARCHAR(100) NOT NULL,
    Description VARCHAR(255),
    Unit_Cost DECIMAL(10, 2) NOT NULL
);

CREATE TABLE Suppliers (
    SupplierID INT PRIMARY KEY AUTO_INCREMENT,
    Name VARCHAR(100) NOT NULL,
    Contact_Info VARCHAR(255)
);

CREATE TABLE Inventory (
    InventoryID INT PRIMARY KEY AUTO_INCREMENT,
    ProductID INT,
    Quantity_Available DECIMAL(10, 2),
    Last_Updated DATE,
    FOREIGN KEY (ProductID) REFERENCES Products(ProductID)
);

CREATE TABLE Production (
    ProductionID INT PRIMARY KEY AUTO_INCREMENT,
    ProductID INT,
    Quantity_Produced DECIMAL(10, 2),
    RawMaterialID INT,
    Quantity_Used DECIMAL(10, 2),
    Production_Date DATE,
    FOREIGN KEY (ProductID) REFERENCES Products(ProductID),
    FOREIGN KEY (RawMaterialID) REFERENCES RawMaterials(MaterialID)
);

CREATE TABLE Supply (
    SupplyID INT PRIMARY KEY AUTO_INCREMENT,
    SupplierID INT,
    MaterialID INT,
    Quantity_Supplied DECIMAL(10, 2),
    Supply_Date DATE,
    FOREIGN KEY (SupplierID) REFERENCES Suppliers(SupplierID),
    FOREIGN KEY (MaterialID) REFERENCES RawMaterials(MaterialID)
);
