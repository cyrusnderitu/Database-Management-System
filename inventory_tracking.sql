-- Database Creation to hold the Tables
CREATE DATABASE INVENTORY;
USE INVENTORY;

-- Drop existing tables if rerunning script
DROP TABLE IF EXISTS OrderItem, PurchaseOrder, Inventory, Product, Category, Supplier, Warehouse;

-- Category Table
CREATE TABLE Category (
    category_id INT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(100) NOT NULL UNIQUE,
    description TEXT
);

-- Supplier Table
CREATE TABLE Supplier (
    supplier_id INT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(100) NOT NULL,
    email VARCHAR(100) UNIQUE,
    phone VARCHAR(20),
    address TEXT
);

-- Warehouse Table
CREATE TABLE Warehouse (
    warehouse_id INT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(100) NOT NULL UNIQUE,
    location TEXT NOT NULL
);

-- Product Table
CREATE TABLE Product (
    product_id INT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(100) NOT NULL,
    sku VARCHAR(50) NOT NULL UNIQUE,
    price DECIMAL(10,2) NOT NULL,
    category_id INT,
    supplier_id INT,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (category_id) REFERENCES Category(category_id),
    FOREIGN KEY (supplier_id) REFERENCES Supplier(supplier_id)
);

-- Inventory Table (One-to-One with Product)
CREATE TABLE Inventory (
    product_id INT PRIMARY KEY,
    warehouse_id INT NOT NULL,
    quantity INT NOT NULL DEFAULT 0,
    last_updated TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
    FOREIGN KEY (product_id) REFERENCES Product(product_id),
    FOREIGN KEY (warehouse_id) REFERENCES Warehouse(warehouse_id)
);

-- PurchaseOrder Table
CREATE TABLE PurchaseOrder (
    purchase_order_id INT AUTO_INCREMENT PRIMARY KEY,
    supplier_id INT NOT NULL,
    order_date DATE NOT NULL,
    status ENUM('Pending', 'Received', 'Cancelled') DEFAULT 'Pending',
    FOREIGN KEY (supplier_id) REFERENCES Supplier(supplier_id)
);

-- OrderItem Table (Many-to-Many between PurchaseOrder and Product)
CREATE TABLE OrderItem (
    order_item_id INT AUTO_INCREMENT PRIMARY KEY,
    purchase_order_id INT NOT NULL,
    product_id INT NOT NULL,
    quantity INT NOT NULL,
    unit_price DECIMAL(10,2) NOT NULL,
    FOREIGN KEY (purchase_order_id) REFERENCES PurchaseOrder(purchase_order_id),
    FOREIGN KEY (product_id) REFERENCES Product(product_id)
);
