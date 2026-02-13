-- Lab Activity 5.4: Customer Loyalty Audit
-- Student Name: [Your Name]
-- Date: February 13, 2026

-- 1. Database Setup
CREATE DATABASE IF NOT EXISTS luxecinema_db;
USE luxecinema_db;

-- 2. Initial Table Creation
-- Use IF NOT EXISTS to avoid creating the table again if it already exists
CREATE TABLE IF NOT EXISTS customers (
    name VARCHAR(100) NOT NULL,
    email VARCHAR(100) NOT NULL UNIQUE,
    visit_count INT NOT NULL DEFAULT 0,
    phone_number VARCHAR(20) -- Add phone_number directly during table creation
);

-- 3. Insert Sample Data (skip if data already exists)
-- Use INSERT IGNORE to avoid inserting duplicates if data already exists
INSERT IGNORE INTO customers (name, email, visit_count, phone_number) VALUES
('Alex Rivera', 'alex.rivera@email.com', 5, '555-0101'),
('Sarah Chen', 'sarah.chen@email.com', 12, '555-0102'),
('Marcus Wong', 'marcus.wong@email.com', 8, '555-0103'),
('Emma Davis', 'emma.davis@email.com', 15, '555-0104'),
('James Smith', 'james.smith@email.com', 20, '555-0105');

-- 4. Data Correction - Update Alex Rivera's visits from 5 to 15
UPDATE customers 
SET visit_count = 15 
WHERE name = 'Alex Rivera' AND email = 'alex.rivera@email.com';

-- 5. The "VIP" Report - Customers with >10 visits, sorted highest to lowest
SELECT 
    name AS 'Customer Name',
    email AS 'Email Address',
    visit_count AS 'Number of Visits',
    phone_number AS 'Contact Number'
FROM customers
WHERE visit_count > 10
ORDER BY visit_count DESC;
