
DROP TABLE IF EXISTS Sales_Reports, Customer_Phones, Customer_Addresses, Product_Warehouses, Order_Details, Products, Orders, Customers;

CREATE TABLE Orders_1NF (
    order_id INT,
    order_date DATE,
    customer_id VARCHAR(10),
    customer_name VARCHAR(100),
    customer_address VARCHAR(255),
    product_id VARCHAR(10),
    product_name VARCHAR(100),
    quantity INT,
    price DECIMAL(10, 2)
);

INSERT INTO Orders_1NF VALUES
(101, '2023-01-01', 'C1', 'Alice', '123 Main St', 'P1', 'Laptop', 2, 1000),
(101, '2023-01-01', 'C1', 'Alice', '123 Main St', 'P2', 'Mouse', 3, 20),
(102, '2023-01-02', 'C2', 'Bob', '456 Oak Ave', 'P3', 'Keyboard', 1, 50);

CREATE TABLE Customers (
    customer_id VARCHAR(10) PRIMARY KEY,
    customer_name VARCHAR(100),
    customer_address VARCHAR(255)
);

INSERT INTO Customers VALUES
('C1', 'Alice', '123 Main St'),
('C2', 'Bob', '456 Oak Ave');

CREATE TABLE Orders (
    order_id INT PRIMARY KEY,
    order_date DATE,
    customer_id VARCHAR(10),
    FOREIGN KEY (customer_id) REFERENCES Customers(customer_id)
);

INSERT INTO Orders VALUES
(101, '2023-01-01', 'C1'),
(102, '2023-01-02', 'C2');

CREATE TABLE Products (
    product_id VARCHAR(10) PRIMARY KEY,
    product_name VARCHAR(100),
    price DECIMAL(10,2)
);

INSERT INTO Products VALUES
('P1', 'Laptop', 1000),
('P2', 'Mouse', 20),
('P3', 'Keyboard', 50);

CREATE TABLE Order_Details (
    order_id INT,
    product_id VARCHAR(10),
    quantity INT,
    PRIMARY KEY (order_id, product_id),
    FOREIGN KEY (order_id) REFERENCES Orders(order_id),
    FOREIGN KEY (product_id) REFERENCES Products(product_id)
);

INSERT INTO Order_Details VALUES
(101, 'P1', 2),
(101, 'P2', 3),
(102, 'P3', 1);

CREATE TABLE Product_Warehouses (
    product_id VARCHAR(10),
    warehouse_id VARCHAR(10),
    PRIMARY KEY (product_id),
    FOREIGN KEY (product_id) REFERENCES Products(product_id)
);

INSERT INTO Product_Warehouses VALUES
('P1', 'W1'),
('P2', 'W2');

CREATE TABLE Customer_Addresses (
    customer_id VARCHAR(10),
    address VARCHAR(255),
    FOREIGN KEY (customer_id) REFERENCES Customers(customer_id)
);

INSERT INTO Customer_Addresses VALUES
('C1', '123 Main St'),
('C1', '456 Park Ave');

CREATE TABLE Customer_Phones (
    customer_id VARCHAR(10),
    phone_number VARCHAR(20),
    FOREIGN KEY (customer_id) REFERENCES Customers(customer_id)
);

INSERT INTO Customer_Phones VALUES
('C1', '555-1234'),
('C1', '555-5678');

CREATE VIEW Sales_Reports AS
SELECT
    o.order_id,
    o.order_date,
    c.customer_name,
    p.product_name,
    od.quantity,
    p.price,
    od.quantity * p.price AS total_price
FROM Orders o
JOIN Customers c ON o.customer_id = c.customer_id
JOIN Order_Details od ON o.order_id = od.order_id
JOIN Products p ON od.product_id = p.product_id;
SELECT * FROM Sales_Reports;
