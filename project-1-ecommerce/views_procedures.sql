

-- VIEW 1: Customer Order Summary
-- ============================================================
-- WHY THIS MATTERS:
-- Instead of joining customers and orders every time we need
-- a summary, we can just query this view as if it were a table.

CREATE OR REPLACE VIEW vw_customer_order_summary AS
SELECT 
    c.customer_id,
    c.name AS customer_name,
    c.email,
    c.state,
    COUNT(o.order_id) AS total_orders,
    SUM(o.total_amount) AS total_spent,
    MAX(o.order_date) AS last_order_date
FROM customers c
LEFT JOIN orders o ON c.customer_id = o.customer_id
WHERE o.status != 'Cancelled' OR o.status IS NULL
GROUP BY c.customer_id, c.name, c.email, c.state;

-- Usage: SELECT * FROM vw_customer_order_summary WHERE total_spent > 50000;


-- ============================================================
-- VIEW 2: Comprehensive Revenue Dashboard
-- ============================================================
-- WHY THIS MATTERS:
-- Dashboards often need real-time data. This view provides a 
-- snapshot of sales and performance grouped by month & category.

CREATE OR REPLACE VIEW vw_monthly_category_sales AS
SELECT 
    YEAR(o.order_date) AS sales_year,
    MONTH(o.order_date) AS sales_month,
    p.category,
    SUM(oi.quantity) AS units_sold,
    SUM(oi.quantity * oi.unit_price) AS gross_revenue
FROM orders o
JOIN order_items oi ON o.order_id = oi.order_id
JOIN products p ON oi.product_id = p.product_id
WHERE o.status != 'Cancelled'
GROUP BY YEAR(o.order_date), MONTH(o.order_date), p.category;

-- Usage: SELECT * FROM vw_monthly_category_sales WHERE sales_year = 2025;


-- ╔══════════════════════════════════════════════════════════════╗
-- ║                   ⚡ STORED PROCEDURES                        ║
-- ║     Saved SQL code that you can execute over and over.       ║
-- ║     Can take parameters to make your logic dynamic.          ║
-- ╚══════════════════════════════════════════════════════════════╝

-- IMPORTANT: When creating procedures in MySQL locally, you often 
-- need to change the DELIMITER so MySQL doesn't stop reading 
-- at the first semicolon inside the BEGIN block.
DELIMITER //

-- ============================================================
-- PROCEDURE 1: Update Order Status
-- ============================================================
-- WHY THIS MATTERS:
-- When a package ships, multiple things should happen. 
-- A procedure acts as an API for your application to safely 
-- change data without knowing the underlying schema.

CREATE PROCEDURE IF NOT EXISTS sp_update_order_status(
    IN p_order_id INT,
    IN p_new_status VARCHAR(50)
)
BEGIN
    -- Update the order status
    UPDATE orders 
    SET status = p_new_status 
    WHERE order_id = p_order_id;
    
    -- If marked as delivered, we could potentially update shipping
    -- (This is just an example of adding logic)
    IF p_new_status = 'Delivered' THEN
        UPDATE shipping
        SET delivered_date = CURDATE()
        WHERE order_id = p_order_id AND delivered_date IS NULL;
    END IF;
    
END //


-- ============================================================
-- PROCEDURE 2: Get Customer Insights (Dynamic Report)
-- ============================================================
-- BUSINESS USE CASE: "Marketing wants a quick report on any customer."

CREATE PROCEDURE IF NOT EXISTS sp_get_customer_insights(
    IN p_customer_id INT
)
BEGIN
    -- 1. Get basic info
    SELECT * FROM vw_customer_order_summary WHERE customer_id = p_customer_id;
    
    -- 2. Get their favorite product categories
    SELECT 
        p.category, 
        COUNT(oi.item_id) AS items_bought,
        SUM(oi.quantity * oi.unit_price) AS total_spent
    FROM orders o
    JOIN order_items oi ON o.order_id = oi.order_id
    JOIN products p ON oi.product_id = p.product_id
    WHERE o.customer_id = p_customer_id AND o.status != 'Cancelled'
    GROUP BY p.category
    ORDER BY total_spent DESC;
END //


-- ╔══════════════════════════════════════════════════════════════╗
-- ║                       🎯 TRIGGERS                           ║
-- ║     Code that automatically runs ("fires") IN RESPONSE to    ║
-- ║     an INSERT, UPDATE, or DELETE on a table.                 ║
-- ╚══════════════════════════════════════════════════════════════╝

-- ============================================================
-- TRIGGER 1: Automatically Deduct Stock After Order
-- ============================================================
-- WHY THIS MATTERS:
-- Never rely on the application codebase to deduct stock.
-- If someone buys 5 laptops, the database should automatically
-- reduce `stock_quantity` by 5 at the exact moment the 
-- order item is inserted. This prevents race conditions.

CREATE TRIGGER trg_after_order_item_insert
AFTER INSERT ON order_items
FOR EACH ROW
BEGIN
    UPDATE products
    SET stock_quantity = stock_quantity - NEW.quantity
    WHERE product_id = NEW.product_id;
END //

DELIMITER ;

-- ============================================================
