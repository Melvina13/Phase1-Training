
CREATE DATABASE ecommerce_data;

USE ecommerce_data;

CREATE TABLE orders (
    invoice_no VARCHAR(20),
    product_id VARCHAR(20),
    quantity INT,
    unit_price DECIMAL(10,2),
    order_date DATE
);

INSERT INTO orders (invoice_no, product_id, quantity, unit_price, order_date) VALUES
('INV001', 'P001', 2, 50.00, '2025-04-01'),
('INV001', 'P002', 1, 100.00, '2025-04-01'),
('INV002', 'P003', 3, 30.00, '2025-04-02'),
('INV003', 'P004', 1, 200.00, '2025-04-03'),
('INV003', 'P005', 2, 75.00, '2025-04-03');

SELECT 
    ROUND(SUM(quantity * unit_price) / COUNT(DISTINCT invoice_no), 2) AS average_order_value
FROM 
    orders;


