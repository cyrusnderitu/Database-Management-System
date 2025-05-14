# 🧾 Inventory Tracking System (MySQL Database)

## 📌 Project Description

This project is a **relational database system** built with **MySQL** designed to manage inventory, suppliers, products, stock levels, and purchase orders for a real-world business.

It provides a solid schema structure with proper use of:

- Primary Keys (PK) and Foreign Keys (FK)
- Constraints (`NOT NULL`, `UNIQUE`)
- Relationships:
  - One-to-Many (e.g., Categories → Products)
  - One-to-One (e.g., Products → Inventory)
  - Many-to-Many (e.g., Purchase Orders ↔ Products via Order Items)

## ⚙️ How to Set Up and Run

### ✅ Requirements

- MySQL Server (version 5.7+ or 8+)
- MySQL Workbench or any SQL client

### 📥 Steps to Import

1. **Download** the `inventory_tracking.sql` file (provided).
2. **Open** MySQL Workbench or your preferred MySQL GUI.
3. **Create a new schema** (e.g., `inventory_db`).
4. **Select your schema**, then **open and run** the SQL file.
5. The tables and constraints will be created automatically.


## 🖼️ Entity Relationship Diagram (ERD)

> 📷 **ERD Screenshot Placeholder**

![alt text](<ChatGPT Image May 14, 2025, 09_14_47 AM.png>)

## 👨‍⚕️ Relationships

- One-to-Many: Category → Product 
    ** One category can have many products but a product only belongs  one  category.
- Many-to-One: Products → Category
    ** Many Products of different orgin e.g Samsung, Iphone, Nokia can only be classified to one category Phone.
- Many-to-Many: PurchaseOrder ↔ Product
    ** A purchase order may contain many products
    ** A product may be ordered in many purchase orders
    This is managed using the OrderItem junction table

## 👤 Author

Built by [Cyrus Nderitu]  
© 2025 Inventory Tracking DB


