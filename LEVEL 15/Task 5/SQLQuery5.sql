
CREATE DATABASE repeat_customers;

USE repeat_customers;

CREATE TABLE orders (
    invoice_no VARCHAR(20),
    customer_id VARCHAR(20),
    order_date DATE
);

INSERT INTO orders (invoice_no, customer_id, order_date) VALUES
('INV001', 'C001', '2024-10-10'), 
('INV002', 'C002', '2024-11-15'),
('INV003', 'C001', '2025-01-05'), 
('INV004', 'C003', '2025-01-20'),
('INV005', 'C002', '2025-02-11'),
('INV006', 'C004', '2025-02-14'),
('INV007', 'C001', '2025-03-01'),
('INV008', 'C002', '2025-03-05'),
('INV009', 'C005', '2025-01-10');

WITH orders_with_quarter AS (
    SELECT 
        customer_id,
        QUARTER(order_date) AS qtr,
        YEAR(order_date) AS yr
    FROM orders
),
latest_quarter AS (
    SELECT 
        MAX(YEAR(order_date)) AS max_year,
        MAX(QUARTER(order_date)) AS max_qtr
    FROM orders
),
curr_and_prev_orders AS (
    SELECT 
        o.customer_id,
        o.yr,
        o.qtr,
        CONCAT(o.yr, '-Q', o.qtr) AS full_quarter
    FROM 
        orders_with_quarter o
    JOIN 
        latest_quarter lq
    ON 
        (o.yr = lq.max_year AND o.qtr IN (lq.max_qtr, lq.max_qtr - 1))
)
SELECT 
    COUNT(DISTINCT customer_id) AS repeat_customers
FROM (
    SELECT 
        customer_id,
        COUNT(DISTINCT full_quarter) AS quarters_with_orders
    FROM 
        curr_and_prev_orders
    GROUP BY 
        customer_id
    HAVING 
        quarters_with_orders = 2
) AS repeat_customers_list;
