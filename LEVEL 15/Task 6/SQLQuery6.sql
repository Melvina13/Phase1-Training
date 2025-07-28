
CREATE DATABASE SalesDB;

USE SalesDB;

CREATE TABLE Customers (
    CustomerID INT PRIMARY KEY,
    CustomerName VARCHAR(100),
    CustomerAddress VARCHAR(255)
);

CREATE TABLE Products (
    ProductID INT PRIMARY KEY,
    ProductName VARCHAR(100),
    ProductCategory VARCHAR(100),
    Price DECIMAL(10,2)
);

CREATE TABLE Sales (
    SaleID INT PRIMARY KEY,
    CustomerID INT,
    ProductID INT,
    SaleDate DATE,
    Quantity INT,
    FOREIGN KEY (CustomerID) REFERENCES Customers(CustomerID),
    FOREIGN KEY (ProductID) REFERENCES Products(ProductID)
);

INSERT INTO Customers (CustomerID, CustomerName, CustomerAddress) VALUES
(1, 'Alice', '123 Street A'),
(2, 'Bob', '456 Street B');

INSERT INTO Products (ProductID, ProductName, ProductCategory, Price) VALUES
(101, 'Laptop', 'Electronics', 1000.00),
(102, 'Phone', 'Electronics', 500.00);

INSERT INTO Sales (SaleID, CustomerID, ProductID, SaleDate, Quantity) VALUES
(1, 1, 101, '2024-04-01', 1),
(2, 2, 102, '2024-04-02', 2);
SELECT * FROM Customers;
SELECT * FROM Products;
SELECT 
    s.SaleID,
    c.CustomerName,
    c.CustomerAddress,
    p.ProductName,
    p.ProductCategory,
    p.Price,
    s.SaleDate,
    s.Quantity,
    (p.Price * s.Quantity) AS TotalAmount
FROM 
    Sales s
JOIN 
    Customers c ON s.CustomerID = c.CustomerID
JOIN 
    Products p ON s.ProductID = p.ProductID;
