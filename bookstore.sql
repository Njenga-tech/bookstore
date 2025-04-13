-- Create and use the bookstore database
CREATE DATABASE bookstore;
USE bookstore;

-- Country Table
CREATE TABLE country (
    country_id INT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(100) NOT NULL
);

-- Address Status Table
CREATE TABLE address_status (
    status_id INT AUTO_INCREMENT PRIMARY KEY,
    status_name VARCHAR(50) NOT NULL
);

-- Address Table
CREATE TABLE address (
    address_id INT AUTO_INCREMENT PRIMARY KEY,
    street VARCHAR(255),
    city VARCHAR(100),
    country_id INT,
    status_id INT,
    FOREIGN KEY (country_id) REFERENCES country (country_id),
    FOREIGN KEY (status_id) REFERENCES address_status(status_id)
);

-- Customer Table
CREATE TABLE customer (
    customer_id INT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(100),
    email VARCHAR(100),
    phone VARCHAR(20)
);

-- Customer Address Table (many addresses per customer)
CREATE TABLE customer_address (
    customer_id INT,
    address_id INT,
    PRIMARY KEY(customer_id, address_id),
    FOREIGN KEY (customer_id) REFERENCES customer (customer_id),
    FOREIGN KEY (address_id) REFERENCES address (address_id)
);

-- Author Table
CREATE TABLE author (
    author_id INT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(100) NOT NULL
);

-- Book Language Table
CREATE TABLE book_language (
    language_id INT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(100) NOT NULL
);

-- Publisher Table
CREATE TABLE publisher (
    publisher_id INT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(100) NOT NULL
);

-- Book Table
CREATE TABLE book (
    book_id INT AUTO_INCREMENT PRIMARY KEY,
    title VARCHAR(255) NOT NULL,
    publisher_id INT,
    language_id INT,
    price DECIMAL(10,2),
    FOREIGN KEY (publisher_id) REFERENCES publisher (publisher_id),
    FOREIGN KEY (language_id) REFERENCES book_language (language_id)
);

-- Book Author Table (many-to-many relationship)
CREATE TABLE book_author (
    book_id INT,
    author_id INT,
    PRIMARY KEY(book_id, author_id),
    FOREIGN KEY (book_id) REFERENCES book (book_id),
    FOREIGN KEY (author_id) REFERENCES author (author_id)
);

-- Shipping Method Table
CREATE TABLE shipping_method (
    method_id INT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(100) NOT NULL
);

-- Order Status Table
CREATE TABLE order_status (
    status_id INT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(100) NOT NULL
);

-- Customer Order Table
CREATE TABLE cust_order (
    order_id INT AUTO_INCREMENT PRIMARY KEY,
    customer_id INT,
    order_date DATE,
    status_id INT,
    shipping_method_id INT,
    FOREIGN KEY (customer_id) REFERENCES customer (customer_id),
    FOREIGN KEY (status_id) REFERENCES order_status (status_id),
    FOREIGN KEY (shipping_method_id) REFERENCES shipping_method (method_id)
);

-- Order Line Table (books in each order)
CREATE TABLE order_line (
    order_line_id INT AUTO_INCREMENT PRIMARY KEY,
    order_id INT,
    book_id INT,
    quantity INT,
    price DECIMAL(10,2),
    FOREIGN KEY (order_id) REFERENCES cust_order (order_id),
    FOREIGN KEY (book_id) REFERENCES book (book_id)
);

-- Order History Table (order status timeline)
CREATE TABLE order_history (
    history_id INT AUTO_INCREMENT PRIMARY KEY,
    order_id INT,
    status_id INT,
    changed_on DATETIME,
    FOREIGN KEY (order_id) REFERENCES cust_order (order_id),
    FOREIGN KEY (status_id) REFERENCES order_status (status_id)
);