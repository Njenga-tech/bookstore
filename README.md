
# Bookstore Database Project

This project simulates the backend database system of a Bookstore. It was built using **MySQL** and is designed to store and manage information about books, authors, customers, orders, and shipping.

##  Project Overview

As a database administrator, your task was to create a fully functional database that:
- Stores data for books, customers, and orders.
- Tracks order history and shipping methods.
- Manages users and assigns roles for access control.

## Technologies Used
- **MySQL** – for database creation and management.
- **MySQL Workbench** – for designing the ERD and executing SQL scripts.
- **Draw.io** – to create the ER diagram visually.

---

##  Database Schema

### Main Tables
- `book`
- `book_author` (many-to-many)
- `author`
- `book_language`
- `publisher`
- `customer`
- `customer_address` (many-to-many)
- `address`
- `address_status`
- `country`
- `cust_order`
- `order_line`
- `order_status`
- `order_history`
- `shipping_method`

---

##  User Roles

We created custom users and permissions for security:
- `admin_user`: Full access to all tables.
- `readonly_user`: Can only `SELECT` data.

### Example SQL for Users
```sql
-- Create admin user
CREATE USER 'admin_user'@'localhost' IDENTIFIED BY 'AdminPassword123!';
GRANT ALL PRIVILEGES ON bookstore.* TO 'admin_user'@'localhost';

-- Create read-only user
CREATE USER 'readonly_user'@'localhost' IDENTIFIED BY 'ReadOnly123!';
GRANT SELECT ON bookstore.* TO 'readonly_user'@'localhost';
