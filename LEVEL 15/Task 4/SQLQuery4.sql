CREATE DATABASE customer_ranking;
USE customer_ranking;
CREATE TABLE orders (
    invoice_no VARCHAR(20),
    customer_id VARCHAR(20),
    gender ENUM('Male', 'Female'),
    product_id VARCHAR(20),
    quantity INT,
    unit_price DECIMAL(10,2),
    order_date DATE
);
INSERT INTO orders (invoice_no, customer_id, gender, product_id, quantity, unit_price, order_date) VALUES
('INV001', 'C001', 'Male', 'P001', 2, 50.00, '2025-04-01'),
('INV002', 'C001', 'Male', 'P002', 1, 80.00, '2025-04-02'),
('INV003', 'C002', 'Female', 'P003', 3, 30.00, '2025-04-03'),
('INV004', 'C003', 'Male', 'P004', 1, 150.00, '2025-04-04'),
('INV005', 'C004', 'Female', 'P005', 2, 60.00, '2025-04-05'),
('INV006', 'C002', 'Female', 'P006', 1, 90.00, '2025-04-06'),
('INV007', 'C005', 'Female', 'P007', 2, 100.00, '2025-04-07'),
('INV008', 'C006', 'Male', 'P008', 1, 120.00, '2025-04-08'),
('INV009', 'C007', 'Male', 'P009', 5, 70.00, '2025-04-09'),
('INV010', 'C003', 'Male', 'P010', 1, 50.00, '2025-04-10');
WITH customer_spend AS (
    SELECT 
        customer_id,
        SUM(quantity * unit_price) AS total_spent
    FROM 
        orders
    GROUP BY 
        customer_id
),
ranked_customers AS (
    SELECT 
        customer_id,
        total_spent,
        RANK() OVER (ORDER BY total_spent DESC) AS spend_rank
    FROM 
        customer_spend
)
SELECT 
    customer_id,
    total_spent,
    spend_rank
FROM 
    ranked_customers
WHERE 
    spend_rank <= 5;
