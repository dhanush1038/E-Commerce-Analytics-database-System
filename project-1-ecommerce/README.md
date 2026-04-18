# E-Commerce Order Analytics System

## Problem Statement
You are hired as a Data Analyst at an online retail company. Management wants answers to:
- Why are sales declining in certain regions?
- Who are our most valuable customers?
- Which products are underperforming?
- What are the monthly revenue trends?

## Entity-Relationship (ER) Diagram

```mermaid
erDiagram
    CUSTOMERS ||--o{ ORDERS : "places"
    ORDERS ||--|{ ORDER_ITEMS : "contains"
    PRODUCTS ||--o{ ORDER_ITEMS : "appears in"
    ORDERS ||--|| PAYMENTS : "paid via"
    ORDERS ||--o| SHIPPING : "shipped by"

    CUSTOMERS {
        INT customer_id PK
        VARCHAR name
        VARCHAR email
        VARCHAR phone
        VARCHAR city
        VARCHAR state
        DATE registration_date
    }

    PRODUCTS {
        INT product_id PK
        VARCHAR name
        VARCHAR category
        DECIMAL price
        INT stock_quantity
        DATE added_date
    }

    ORDERS {
        INT order_id PK
        INT customer_id FK
        DATE order_date
        VARCHAR status
        DECIMAL total_amount
    }

    ORDER_ITEMS {
        INT item_id PK
        INT order_id FK
        INT product_id FK
        INT quantity
        DECIMAL unit_price
        DECIMAL discount
    }

    PAYMENTS {
        INT payment_id PK
        INT order_id FK
        VARCHAR payment_method
        DATE payment_date
        DECIMAL amount
    }

    SHIPPING {
        INT shipping_id PK
        INT order_id FK
        VARCHAR carrier
        VARCHAR tracking_number
        DATE shipped_date
        DATE delivered_date
    }
```

## How to Read the ER Diagram

| Symbol | Meaning |
|--------|---------|
| `\|\|--o{` | One-to-Many (one customer → many orders) |
| `\|\|--\|\|` | One-to-One (one order → one payment) |
| `PK` | Primary Key — uniquely identifies each row |
| `FK` | Foreign Key — links to another table's PK |

## Table Relationships Explained

1. **CUSTOMERS → ORDERS**: One customer can place many orders (1:N)
2. **ORDERS → ORDER_ITEMS**: One order can contain many items (1:N)
3. **PRODUCTS → ORDER_ITEMS**: One product can appear in many order items (1:N)
4. **ORDERS → PAYMENTS**: Each order has one payment record (1:1)
5. **ORDERS → SHIPPING**: Each order can have one shipping record (1:1, optional)

## Files in This Project

| File | What It Contains |
|------|-----------------|
| `schema.sql` | CREATE TABLE statements — run this FIRST |
| `seed_data.sql` | INSERT statements with realistic sample data — run SECOND |
| `queries.sql` | All business queries (Basic → Advanced) |
| `views_procedures.sql` | Views, Stored Procedures |

## How to Run (MySQL)

```sql
-- Step 1: Create the database
SOURCE schema.sql;

-- Step 2: Load sample data
SOURCE seed_data.sql;

-- Step 3: Run any query from queries.sql
```
