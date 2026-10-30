# Retail Sales & Customer Analytics

## Project Overview

The Retail Sales & Customer Analytics project is a MySQL-based data analysis project designed to analyze retail business data.

The project focuses on understanding customer purchasing behavior, product performance, sales revenue, order trends, and inventory levels.

The database contains four tables: Customers, Products, Orders, and Order Items.

## Objectives

- Analyze total sales and business revenue.
- Identify top-selling products.
- Understand customer purchasing behavior.
- Analyze monthly sales performance.
- Identify repeat customers.
- Evaluate product category performance.
- Monitor inventory and stock levels.
- Analyze order statuses.


## Technologies Used

- **Database:** MySQL
- **Database Management Tool:** MySQL Workbench
- **Language:** SQL
- **Operating System:** Windows

## Database Structure

The project contains four relational tables:

1. **Customers** – Stores customer information such as name, gender, city, email, and signup date.
2. **Products** – Stores product details such as product name, category, price, and stock quantity.
3. **Orders** – Stores customer orders, order dates, and order statuses.
4. **Order Items** – Stores the products included in each order, along with quantity and unit price.

These tables are connected using Primary Keys and Foreign Keys.


## SQL Concepts Used

The following SQL concepts were implemented in this project:

- CREATE DATABASE and CREATE TABLE
- INSERT INTO
- SELECT
- WHERE
- ORDER BY
- GROUP BY
- HAVING
- Aggregate Functions: SUM(), COUNT(), AVG()
- Joins: INNER JOIN
- LIKE Operator
- CASE Statements
- Primary Keys and Foreign Keys
- Subqueries and data analysis queries

## Key Business Analysis

- Total business revenue analysis
- Product-wise revenue analysis
- Best-selling product identification
- Monthly revenue analysis
- Customer spending analysis
- Repeat customer identification
- Order status analysis
- Category-wise revenue analysis
- Average order value calculation
- Inventory stock analysis
- Restocking recommendations
- Delivered orders revenue analysis



## How to Run the Project

Follow these steps to run the project:

1. Install MySQL Server and MySQL Workbench.
2. Open MySQL Workbench and connect to the local MySQL server.
3. Open the `retail_analytics.sql` file.
4. Execute the SQL script to create and populate the database.
5. Run the analysis queries to explore retail sales and customer data.

## Project Outcome

This project demonstrates how SQL can be used to manage relational data and generate meaningful business insights from retail sales data.

It helps identify sales trends, customer purchasing patterns, product performance, and inventory requirements.