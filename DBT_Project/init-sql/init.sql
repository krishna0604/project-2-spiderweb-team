
-- Create categories table
CREATE TABLE IF NOT EXISTS categories (
    CategoryID SERIAL PRIMARY KEY,
    CategoryName VARCHAR(100)
);

-- Create customers table
CREATE TABLE IF NOT EXISTS customers (
    CustomerID SERIAL PRIMARY KEY,
    CompanyName VARCHAR(100),
    ContactName VARCHAR(100),
    Country VARCHAR(50)
);

-- Create employees table
CREATE TABLE IF NOT EXISTS employees (
    EmployeeID SERIAL PRIMARY KEY,
    LastName VARCHAR(100),
    FirstName VARCHAR(100),
    Title VARCHAR(50),
    HireDate DATE
);

-- Create orders table
CREATE TABLE IF NOT EXISTS orders (
    OrderID INT PRIMARY KEY,
    CustomerID VARCHAR(50),
    EmployeeID INT,
    OrderDate DATE,
    shipVia INT,
    Freight DECIMAL(10, 2)
);

-- Create products table
CREATE TABLE IF NOT EXISTS products (
    ProductID INT PRIMARY KEY,
    ProductName VARCHAR(100),
    SupplierID INT,
    CategoryID INT,
    UnitPrice DECIMAL(10, 2)
);

-- Create suppliers table
CREATE TABLE IF NOT EXISTS suppliers (
    SupplierID SERIAL PRIMARY KEY,
    CompanyName VARCHAR(100),
    ContactName VARCHAR(100),
    Country VARCHAR(50)
);

-- Create order_details table
CREATE TABLE IF NOT EXISTS order_details (
    OrderDetailID SERIAL PRIMARY KEY,
    OrderID INT,
    ProductID INT,
    UnitPrice DECIMAL(10, 2),
    Quantity INT,
    Discount DECIMAL(10, 2)
);