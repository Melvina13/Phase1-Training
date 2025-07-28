
CREATE DATABASE customer_orders_alt;

USE customer_orders_alt;

CREATE TABLE orders (
    invoice_no VARCHAR(20),
    customer_id VARCHAR(20),
    product_id VARCHAR(20),
    quantity INT,
    unit_price DECIMAL(10,2),
    order_date DATE
);

INSERT INTO orders (invoice_no, customer_id, product_id, quantity, unit_price, order_date) VALUES
('INV001', 'C101', 'P01', 2, 40.00, '2025-04-01'),
('INV002', 'C101', 'P02', 1, 60.00, '2025-04-02'),
('INV003', 'C101', 'P03', 1, 70.00, '2025-04-03'),
('INV004', 'C101', 'P04', 2, 30.00, '2025-04-04'),
('INV005', 'C101', 'P05', 3, 20.00, '2025-04-05'),

('INV006', 'C102', 'P01', 1, 100.00, '2025-04-01'),
('INV007', 'C102', 'P02', 1, 90.00, '2025-04-02'),

('INV008', 'C103', 'P01', 2, 150.00, '2025-04-01'),
('INV009', 'C103', 'P02', 2, 130.00, '2025-04-02'),
('INV010', 'C103', 'P03', 1, 120.00, '2025-04-03'),
('INV011', 'C103', 'P04', 1, 140.00, '2025-04-04'),
('INV012', 'C103', 'P05', 1, 160.00, '2025-04-05');

SELECT customer_id, total_orders, total_spent
FROM (
    SELECT 
        customer_id,
        COUNT(DISTINCT invoice_no) AS total_orders,
        SUM(quantity * unit_price) AS total_spent
    FROM orders
    GROUP BY customer_id
    HAVING COUNT(DISTINCT invoice_no) >= 5
) AS customer_summary
ORDER BY total_spent DESC
LIMIT 1;
