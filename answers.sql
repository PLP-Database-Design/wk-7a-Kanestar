-- Question 1 Achieving 1NF
ALTER TABLE ProductDetail
DROP COLUMN Products;

CREATE TABLE Products (
    ProductID INT PRIMARY KEY AUTO_INCREMENT,
    ProductName VARCHAR(50) NOT NULL,
    order_id INT NOT NULL, 
    FOREIGN KEY (order_id) REFERENCES ProductDetail(OrderID)
);

-- 5. Insert data into Products
INSERT INTO Products (ProductName, order_id) 
VALUES 
    ('Laptop', 101),
    ('Mouse', 101),
    ('Tablet', 102),
    ('Keyboard', 102),
    ('Mouse', 102),
    ('Phone', 103);

-- Create the customer orders table
CREATE TABLE orders (
    order_id INT PRIMARY KEY,
    customer_name VARCHAR(100)
);

-- Add the customer data
INSERT INTO orders VALUES
(101, 'John Doe'),
(102, 'Jane Smith'),
(103, 'Emily Clark');

-- Connect the tables
ALTER TABLE order_details
ADD FOREIGN KEY (order_id) REFERENCES orders(order_id);

-- Remove customer names from order details
ALTER TABLE order_details
DROP COLUMN customer_name;