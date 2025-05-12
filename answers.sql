-- Question 1: Achieving 1NF (First Normal Form)
-- Original table: ProductDetail
-- Problem: Products column contains multiple values (violates 1NF)
-- Solution: Split the table into individual rows for each product
CREATE TABLE ProductDetail_1NF (
    OrderID INT,
    CustomerName VARCHAR(100),
    Product VARCHAR(50)
);

-- Insert the normalized data
INSERT INTO ProductDetail_1NF (OrderID, CustomerName, Product) VALUES
    (101, 'John Doe', 'Laptop'),
    (101, 'John Doe', 'Mouse'),
    (102, 'Jane Smith', 'Tablet'),
    (102, 'Jane Smith', 'Keyboard'),
    (102, 'Jane Smith', 'Mouse'),
    (103, 'Emily Clark', 'Phone');

-- Question 2: Achieving 2NF (Second Normal Form)
-- Original table: OrderDetails
-- Problem: CustomerName depends on OrderID (partial dependency)

-- Solution: Split into two tables to remove partial dependency
-- 1. Orders table (contains customer information)
CREATE TABLE Orders (
    OrderID INT PRIMARY KEY,
    CustomerName VARCHAR(100)
);

-- 2. OrderItems table (contains product and quantity information)
CREATE TABLE OrderItems (
    OrderID INT,
    Product VARCHAR(50),
    Quantity INT,
    PRIMARY KEY (OrderID, Product),
    FOREIGN KEY (OrderID) REFERENCES Orders(OrderID)
);

-- Insert data into Orders table
INSERT INTO Orders (OrderID, CustomerName) VALUES
    (101, 'John Doe'),
    (102, 'Jane Smith'),
    (103, 'Emily Clark');

-- Insert data into OrderItems table
INSERT INTO OrderItems (OrderID, Product, Quantity) VALUES
    (101, 'Laptop', 2),
    (101, 'Mouse', 1),
    (102, 'Tablet', 3),
    (102, 'Keyboard', 1),
    (102, 'Mouse', 2),
    (103, 'Phone', 1); 