#E-COMMERCE-DATABASE-TASK-3

This repository contains the schema and SQL scripts for an e-commerce database system. The database is designed to handle various e-commerce operations, including user management, product catalog, orders, payments, and more.

## Features

- Users: Manage user details, including authentication and profiles.
- Products: Catalog of products with categories, prices, and inventory management.
- Orders: Track customer orders, including order status and payment details.
- Payments: Handle payment information, linked to orders.
- Categories: Organize products into categories for easy navigation.
- order_items: Details of each item in an order.

## Database Schema

The database is composed of the following key tables:

- users: Stores user information (e.g., name, email, password).
- products: Stores product details (e.g., name, price, category).
- orders: Stores customer order information (e.g., order date, status).
- order_items: Details of each item in an order.
- payments: Payment records for orders.
- categories: Product categories for classification.

## Views & Summaries

The following views summarize important data:

- user_order_summary: Total number of orders and amount spent per user.
- product_sales_summary: Total quantity sold and revenue per product.
- category_sales_summary: Total revenue and products sold per category.

## Indexes

The database includes indexes on commonly queried columns to improve performance:

- idx_orders_user_id: Index on user_id in the orders table.
- idx_order_items_order_id: Index on order_id in the order_items table.
- idx_order_items_product_id: Index on product_id in the order_items table.
- idx_products_category_id: Index on category_id in the products table.
- idx_payments_order_id: Index on order_id in the payments table.

## Error Handling

- The database implements error handling through SQL constraints (e.g., NOT NULL, FOREIGN KEY).
- SQL queries are designed to handle edge cases and prevent common issues (e.g., duplicate orders, missing products).

## Performance Considerations

- Indexing is used on key columns to improve query speed.
- Database normalization ensures data integrity, while denormalization may be used for performance in reporting queries.
- Regular index maintenance and statistics updates are recommended.



