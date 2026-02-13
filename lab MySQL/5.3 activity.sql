-- Drop the existing database if it exists and recreate it
DROP DATABASE IF EXISTS freshpress_inventory;
CREATE DATABASE freshpress_inventory;
USE freshpress_inventory;

-- Create the Products Table with Constraints
CREATE TABLE products (
    id INT AUTO_INCREMENT PRIMARY KEY,       -- Primary Key (id) with Auto Increment
    item_name VARCHAR(255) NOT NULL,         -- Item name cannot be NULL
    current_stock INT NOT NULL,              -- Current stock cannot be NULL
    reorder_level INT NOT NULL,              -- Reorder level cannot be NULL
    price DECIMAL(10, 2) NOT NULL            -- Price cannot be NULL
);

-- Insert Data for 5 Items
INSERT INTO products (item_name, current_stock, reorder_level, price)
VALUES
('Espresso Beans', 20, 15, 5.99),
('Whole Milk', 8, 10, 2.49),
('Oat Milk', 5, 10, 3.99),
('Sugar', 25, 15, 1.49),
('Stirrers', 30, 25, 0.99);

-- Stock Alert Query (Find items that need to be reordered)
-- Displaying all products and showing if they need to be reordered (if stock < reorder level)
SELECT item_name, current_stock, reorder_level, 
       CASE 
           WHEN current_stock < reorder_level THEN 'Low Stock - Reorder Needed'
           ELSE 'Sufficient Stock'
       END AS stock_status
FROM products;
