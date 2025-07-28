
CREATE TABLE Customers (
    customer_id VARCHAR(10) PRIMARY KEY,
    customer_name VARCHAR(50),
    customer_address VARCHAR(100)
);

CREATE TABLE Orders (
    order_id INT PRIMARY KEY,
    order_date DATE,
    customer_id VARCHAR(10),
    FOREIGN KEY (customer_id) REFERENCES Customers(customer_id)
);

INSERT INTO Customers (customer_id, customer_name, customer_address)
VALUES 
('C1', 'Alice', '123 Main St'),
('C2', 'Bob', '456 Oak Ave');

INSERT INTO Orders (order_id, order_date, customer_id)
VALUES 
(101, '2023-01-01', 'C1'),
(102, '2023-01-02', 'C2');

SELECT * FROM Customers;

SELECT * FROM Orders;
