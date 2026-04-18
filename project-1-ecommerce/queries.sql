



-- ============================================================
-- QUERY 1: List all orders placed in the last 30 days
-- ============================================================
-- BUSINESS QUESTION: "What orders came in recently? 
--                     Are we getting enough new orders?"

-- WHY THIS MATTERS:
--   Management checks this daily. If order count is dropping,
--   something is wrong (marketing? website? stock issues?)
-- ============================================================

SELECT 
    o.order_id,
    c.name           AS customer_name,
    o.order_date,
    o.status,
    o.total_amount
FROM orders o
JOIN customers c ON o.customer_id = c.customer_id
WHERE o.order_date >= CURDATE() - INTERVAL 30 DAY
ORDER BY o.order_date DESC;

-- NOTE: If you run this on a date far from the seed data (2025),
-- you may get 0 results. To test, change the WHERE to:
-- WHERE o.order_date >= '2025-12-01'


-- ============================================================
-- QUERY 2: Find total revenue generated
-- ============================================================
-- BUSINESS QUESTION: "How much total money have we made?"
--
-- CONCEPTS USED:
--   SUM()         → Adds up all values in a column
--   WHERE filter  → We exclude 'Cancelled' orders because
--                    cancelled orders don't count as revenue!
--   FORMAT()      → Makes big numbers readable (12,34,567.00)
--
-- WHY THIS MATTERS:
--   This is THE #1 metric every CEO looks at.
--   Revenue = the lifeblood of the business.
-- ============================================================

SELECT 
    FORMAT(SUM(total_amount), 2) AS total_revenue,
    COUNT(*)                      AS total_orders,
    FORMAT(AVG(total_amount), 2) AS avg_order_value
FROM orders
WHERE status != 'Cancelled';


-- ============================================================
-- QUERY 3: Count orders by status
-- ============================================================
-- BUSINESS QUESTION: "How many orders are pending vs delivered 
--                     vs cancelled? Is our fulfillment healthy?"
--
-- CONCEPTS USED:
--   GROUP BY  → Groups rows that share the same status
--   COUNT(*)  → Counts rows in each group
--   ORDER BY COUNT(*) DESC → Shows biggest group first
--
-- WHY THIS MATTERS:
--   Too many "Pending" = processing bottleneck
--   Too many "Cancelled" = customer trust issue
--   Healthy business = majority are "Delivered"
-- ============================================================

SELECT 
    status,
    COUNT(*)                                        AS order_count,
    FORMAT(SUM(total_amount), 2)                    AS total_value,
    ROUND(COUNT(*) * 100.0 / (SELECT COUNT(*) FROM orders), 1) AS percentage
FROM orders
GROUP BY status
ORDER BY order_count DESC;


-- ============================================================
-- QUERY 4: List customers who have never placed an order
-- ============================================================
-- BUSINESS QUESTION: "Who signed up but never bought anything?
--                     These are leads we're losing!"
--
-- CONCEPTS USED:
--   LEFT JOIN → Keeps ALL customers, even if they have 0 orders
--   IS NULL   → Filters to only those with no matching order
--
-- WHY IT'S LEFT JOIN (not INNER JOIN):
--   INNER JOIN = "Show me customers WHO HAVE orders"
--   LEFT JOIN  = "Show me ALL customers, even with 0 orders"
--   Then IS NULL picks out the ones with 0 orders.
--
-- ALTERNATIVE (Subquery approach):
--   SELECT * FROM customers 
--   WHERE customer_id NOT IN (SELECT customer_id FROM orders);
-- ============================================================

SELECT 
    c.customer_id,
    c.name,
    c.email,
    c.city,
    c.state,
    c.registration_date,
    DATEDIFF(CURDATE(), c.registration_date) AS days_since_signup
FROM customers c
LEFT JOIN orders o ON c.customer_id = o.customer_id
WHERE o.order_id IS NULL
ORDER BY c.registration_date;


-- ╔══════════════════════════════════════════════════════════════╗
-- ║              🟡 INTERMEDIATE QUERIES (5-10)                  ║
-- ║     Concepts: JOINs, GROUP BY, HAVING, Subqueries            ║
-- ╚══════════════════════════════════════════════════════════════╝


-- ============================================================
-- QUERY 5: Top 5 customers by total spending
-- ============================================================
-- BUSINESS QUESTION: "Who are our VIP customers? 
--                     Who should we prioritize for loyalty rewards?"
--
-- CONCEPTS USED:
--   JOIN       → Connect orders to customer names
--   GROUP BY   → One row per customer
--   SUM()      → Total spending per customer
--   ORDER BY DESC + LIMIT 5 → Top 5 only
--   HAVING     → (optional) could filter for minimum spend
--
-- WHY THIS MATTERS:
--   The Pareto Principle: 20% of customers generate 80% of revenue.
--   Knowing your top customers = knowing who to never lose.
-- ============================================================

SELECT 
    c.customer_id,
    c.name,
    c.city,
    c.state,
    COUNT(o.order_id)              AS total_orders,
    FORMAT(SUM(o.total_amount), 2) AS total_spent,
    FORMAT(AVG(o.total_amount), 2) AS avg_order_value,
    MIN(o.order_date)              AS first_order,
    MAX(o.order_date)              AS last_order
FROM customers c
JOIN orders o ON c.customer_id = o.customer_id
WHERE o.status != 'Cancelled'
GROUP BY c.customer_id, c.name, c.city, c.state
ORDER BY SUM(o.total_amount) DESC
LIMIT 5;


-- ============================================================
-- QUERY 6: Monthly revenue trend for the past year
-- ============================================================
-- BUSINESS QUESTION: "Are our sales going UP or DOWN each month?
--                     Which months are strongest?"
--
-- CONCEPTS USED:
--   YEAR() / MONTH()   → Extract year and month from a date
--   DATE_FORMAT()       → Makes dates readable ('Jan 2025')
--   GROUP BY year, month → One row per month
--   SUM()               → Total revenue that month
--
-- WHY THIS MATTERS:
--   Spot seasonal trends (Diwali/Christmas = high sales?)
--   Identify declining months BEFORE it's too late.
-- ============================================================

SELECT 
    YEAR(o.order_date)                           AS order_year,
    MONTH(o.order_date)                          AS order_month,
    DATE_FORMAT(o.order_date, '%b %Y')           AS month_name,
    COUNT(*)                                     AS total_orders,
    FORMAT(SUM(o.total_amount), 2)               AS monthly_revenue,
    COUNT(DISTINCT o.customer_id)                AS unique_customers
FROM orders o
WHERE o.status != 'Cancelled'
GROUP BY YEAR(o.order_date), MONTH(o.order_date), DATE_FORMAT(o.order_date, '%b %Y')
ORDER BY order_year, order_month;


-- ============================================================
-- QUERY 7: Products that have never been ordered
-- ============================================================
-- BUSINESS QUESTION: "Which products are sitting on shelves 
--                     collecting dust? Should we discount or remove them?"
--
-- CONCEPTS USED:
--   LEFT JOIN     → Keep all products, even unordered ones
--   IS NULL       → Filter to products with 0 order items
--
-- WHY THIS MATTERS:
--   Dead stock = money locked up in inventory.
--   Action: discount it, bundle it, or discontinue it.
-- ============================================================

SELECT 
    p.product_id,
    p.name           AS product_name,
    p.category,
    FORMAT(p.price, 2) AS price,
    p.stock_quantity,
    p.added_date,
    DATEDIFF(CURDATE(), p.added_date) AS days_in_catalog
FROM products p
LEFT JOIN order_items oi ON p.product_id = oi.product_id
WHERE oi.item_id IS NULL
ORDER BY p.price DESC;


-- ============================================================
-- QUERY 8: Most popular product category by units sold
-- ============================================================
-- BUSINESS QUESTION: "Which category should we invest more in?
--                     Where is customer demand highest?"
--
-- CONCEPTS USED:
--   Two JOINs      → order_items → products (to get category)
--   SUM(quantity)   → Total units sold (not just order count)
--   GROUP BY category → One row per category
--
-- WHY THIS MATTERS:
--   If Electronics sells 10 units worth ₹10L total, and
--   Books sells 100 units worth ₹50K total — different strategies!
-- ============================================================

SELECT 
    p.category,
    SUM(oi.quantity)                                      AS total_units_sold,
    COUNT(DISTINCT oi.order_id)                           AS total_orders,
    FORMAT(SUM(oi.quantity * oi.unit_price), 2)           AS gross_revenue,
    FORMAT(AVG(oi.unit_price), 2)                         AS avg_unit_price,
    COUNT(DISTINCT p.product_id)                          AS products_in_category
FROM order_items oi
JOIN products p ON oi.product_id = p.product_id
JOIN orders o ON oi.order_id = o.order_id
WHERE o.status != 'Cancelled'
GROUP BY p.category
ORDER BY total_units_sold DESC;


-- ============================================================
-- QUERY 9: Average order value per city
-- ============================================================
-- BUSINESS QUESTION: "Which cities have the highest average spend?
--                     Where should we focus marketing budget?"
--
-- CONCEPTS USED:
--   JOIN       → Connect orders to customer city
--   AVG()      → Average order amount per city
--   HAVING     → Only show cities with at least 2 orders
--               (1 order doesn't make a trend)
--
-- WHY THIS MATTERS:
--   Mumbai avg = ₹50K but Patna avg = ₹500?
--   → Premium product ads go to Mumbai, budget deals to Patna.
-- ============================================================

SELECT 
    c.city,
    c.state,
    COUNT(o.order_id)              AS total_orders,
    FORMAT(SUM(o.total_amount), 2) AS total_revenue,
    FORMAT(AVG(o.total_amount), 2) AS avg_order_value,
    COUNT(DISTINCT c.customer_id)  AS unique_customers
FROM customers c
JOIN orders o ON c.customer_id = o.customer_id
WHERE o.status != 'Cancelled'
GROUP BY c.city, c.state
HAVING COUNT(o.order_id) >= 2
ORDER BY AVG(o.total_amount) DESC;


-- ============================================================
-- QUERY 10: Orders where payment amount doesn't match order total
-- ============================================================
-- BUSINESS QUESTION: "Are there billing discrepancies?
--                     This could mean fraud, bugs, or refund issues."
--
-- CONCEPTS USED:
--   JOIN          → Connect orders to payments
--   ABS()         → Absolute value (handles both over/under)
--   WHERE != or <> → "not equal to"
--
-- WHY THIS MATTERS:
--   In real companies, payment mismatches = AUDIT RED FLAGS.
--   Finance teams run this query daily.
-- ============================================================

SELECT 
    o.order_id,
    c.name                           AS customer_name,
    o.order_date,
    o.status,
    FORMAT(o.total_amount, 2)        AS order_total,
    FORMAT(p.amount, 2)              AS payment_amount,
    FORMAT(ABS(o.total_amount - p.amount), 2) AS difference,
    p.payment_method,
    p.payment_status
FROM orders o
JOIN payments p ON o.order_id = p.order_id
JOIN customers c ON o.customer_id = c.customer_id
WHERE ABS(o.total_amount - p.amount) > 0.01    -- tiny tolerance for rounding
ORDER BY ABS(o.total_amount - p.amount) DESC;


-- ============================================================
-- QUERY 11: Rank customers by total spending within each state
-- ============================================================
-- BUSINESS QUESTION: "Who is the top spender in each state?
--                     Useful for regional marketing campaigns."
--
-- CONCEPTS USED:
--   RANK() OVER (PARTITION BY ... ORDER BY ...)
--     → PARTITION BY state = "restart ranking for each state"
--     → ORDER BY total DESC = "rank by spending, highest first"
--   RANK vs DENSE_RANK vs ROW_NUMBER:
--     RANK:       1, 2, 2, 4   (skips after tie)
--     DENSE_RANK: 1, 2, 2, 3   (no skip after tie)
--     ROW_NUMBER: 1, 2, 3, 4   (no ties allowed)
--
-- HOW TO READ THE RESULT:
--   If Maharashtra has 3 customers spending ₹2L, ₹1L, ₹50K
--   they get ranks 1, 2, 3 within Maharashtra.
-- ============================================================

SELECT 
    c.state,
    c.name,
    c.city,
    COUNT(o.order_id)              AS total_orders,
    SUM(o.total_amount)            AS total_spent,
    RANK() OVER (
        PARTITION BY c.state 
        ORDER BY SUM(o.total_amount) DESC
    ) AS state_rank
FROM customers c
JOIN orders o ON c.customer_id = o.customer_id
WHERE o.status != 'Cancelled'
GROUP BY c.state, c.name, c.city, c.customer_id
ORDER BY c.state, state_rank;


-- ============================================================
-- QUERY 12: Month-over-month revenue growth percentage
-- ============================================================
-- BUSINESS QUESTION: "Is our revenue growing or shrinking 
--                     compared to last month? By how much %?"
--
-- CONCEPTS USED:
--   LAG() OVER (ORDER BY ...)
--     → LAG = "look at the PREVIOUS row's value"
--     → LAG(revenue, 1) = "revenue from 1 row before"
--   CTE (WITH clause)
--     → Creates a temporary named result set
--     → Like a "mini table" that exists only for this query
--   Growth formula: ((current - previous) / previous) * 100
--
-- WHY CTE?
--   We need to calculate monthly revenue FIRST (step 1),
--   then compare each month to the previous (step 2).
--   CTE lets us do this in two clean steps instead of
--   cramming everything into one messy query.
-- ============================================================

WITH monthly_revenue AS (
    -- Step 1: Calculate revenue per month
    SELECT 
        YEAR(order_date)  AS yr,
        MONTH(order_date) AS mn,
        DATE_FORMAT(order_date, '%b %Y') AS month_name,
        SUM(total_amount) AS revenue,
        COUNT(*)          AS order_count
    FROM orders
    WHERE status != 'Cancelled'
    GROUP BY YEAR(order_date), MONTH(order_date), DATE_FORMAT(order_date, '%b %Y')
)
-- Step 2: Compare each month to the previous month
SELECT 
    month_name,
    FORMAT(revenue, 2)                                     AS current_revenue,
    FORMAT(LAG(revenue) OVER (ORDER BY yr, mn), 2)         AS previous_revenue,
    order_count,
    CASE
        WHEN LAG(revenue) OVER (ORDER BY yr, mn) IS NULL THEN 'N/A (first month)'
        WHEN LAG(revenue) OVER (ORDER BY yr, mn) = 0     THEN 'N/A (prev was zero)'
        ELSE CONCAT(
            ROUND(
                (revenue - LAG(revenue) OVER (ORDER BY yr, mn)) 
                / LAG(revenue) OVER (ORDER BY yr, mn) * 100, 
            1),
            '%'
        )
    END AS growth_percentage
FROM monthly_revenue
ORDER BY yr, mn;


-- ============================================================
-- QUERY 13: Repeat customers vs one-time buyers
-- ============================================================
-- BUSINESS QUESTION: "What % of our customers come back?
--                     Are we retaining customers or losing them?"
--
-- CONCEPTS USED:
--   CTE         → First, count orders per customer
--   CASE        → Classify: 'One-Time', 'Repeat', 'Loyal VIP'
--   Nested GROUP BY → Group by the classification
--
-- WHY THIS MATTERS:
--   Acquiring a new customer costs 5-7x more than retaining one.
--   If repeat rate is low → loyalty program, email campaigns needed.
-- ============================================================

WITH customer_orders AS (
    -- Step 1: Count orders per customer (excluding cancelled)
    SELECT 
        c.customer_id,
        c.name,
        COUNT(o.order_id) AS order_count,
        SUM(o.total_amount) AS total_spent
    FROM customers c
    JOIN orders o ON c.customer_id = o.customer_id
    WHERE o.status != 'Cancelled'
    GROUP BY c.customer_id, c.name
),
customer_segments AS (
    -- Step 2: Classify each customer
    SELECT 
        *,
        CASE
            WHEN order_count = 1 THEN 'One-Time Buyer'
            WHEN order_count BETWEEN 2 AND 3 THEN 'Repeat Customer'
            WHEN order_count >= 4 THEN 'Loyal VIP'
        END AS customer_segment
    FROM customer_orders
)
-- Step 3: Summarize by segment
SELECT 
    customer_segment,
    COUNT(*)                           AS customer_count,
    ROUND(COUNT(*) * 100.0 / (SELECT COUNT(*) FROM customer_segments), 1) AS percentage,
    FORMAT(SUM(total_spent), 2)        AS segment_revenue,
    FORMAT(AVG(total_spent), 2)        AS avg_revenue_per_customer
FROM customer_segments
GROUP BY customer_segment
ORDER BY customer_count DESC;

-- BONUS: See who the VIP/Repeat customers actually are
-- (Uncomment to run)
/*
SELECT name, order_count, FORMAT(total_spent, 2) AS total_spent, customer_segment
FROM customer_segments
ORDER BY total_spent DESC;
*/


-- ============================================================
-- QUERY 14: Products with declining sales over the last 3 months
-- ============================================================
-- BUSINESS QUESTION: "Which products are losing momentum?
--                     Should we discount them or discontinue?"
--
-- CONCEPTS USED:
--   CTE             → Calculate monthly sales per product
--   LAG()           → Compare current month to previous month
--   Multiple CTEs   → Chain them together (CTE1 → CTE2)
--   HAVING          → Filter for products with actual decline
--
-- HOW IT WORKS:
--   1. Calculate units sold per product per month
--   2. Use LAG to get "previous month's sales"
--   3. Flag products where current < previous for 2+ months
-- ============================================================

WITH monthly_product_sales AS (
    -- Step 1: Monthly sales per product (last 3 months of data)
    SELECT 
        p.product_id,
        p.name AS product_name,
        p.category,
        YEAR(o.order_date)  AS yr,
        MONTH(o.order_date) AS mn,
        DATE_FORMAT(o.order_date, '%b %Y') AS month_name,
        SUM(oi.quantity) AS units_sold,
        SUM(oi.quantity * oi.unit_price) AS revenue
    FROM order_items oi
    JOIN products p ON oi.product_id = p.product_id
    JOIN orders o ON oi.order_id = o.order_id
    WHERE o.status != 'Cancelled'
      AND o.order_date >= '2025-07-01'   -- Focus on recent months
    GROUP BY p.product_id, p.name, p.category,
             YEAR(o.order_date), MONTH(o.order_date), 
             DATE_FORMAT(o.order_date, '%b %Y')
),
with_previous AS (
    -- Step 2: Add previous month's units for comparison
    SELECT 
        *,
        LAG(units_sold) OVER (
            PARTITION BY product_id 
            ORDER BY yr, mn
        ) AS prev_month_units,
        LAG(revenue) OVER (
            PARTITION BY product_id 
            ORDER BY yr, mn
        ) AS prev_month_revenue
    FROM monthly_product_sales
)
-- Step 3: Show products where sales dropped
SELECT 
    product_name,
    category,
    month_name,
    units_sold          AS current_units,
    prev_month_units,
    CASE 
        WHEN prev_month_units IS NULL THEN 'No prior data'
        WHEN units_sold < prev_month_units THEN '📉 DECLINING'
        WHEN units_sold = prev_month_units THEN '➡️ FLAT'
        ELSE '📈 GROWING'
    END AS trend
FROM with_previous
WHERE prev_month_units IS NOT NULL
ORDER BY product_name, yr, mn;


-- ============================================================
-- QUERY 15: Revenue Dashboard — Comprehensive Summary
-- ============================================================
-- BUSINESS QUESTION: "Give me the full picture in one query:
--                     revenue, orders, AOV, top category, 
--                     payment method split — everything."
--
-- CONCEPTS USED:
--   Multiple subqueries → Each calculates a different metric
--   UNION ALL          → Stacks results vertically (like a dashboard)
--   FORMAT()           → Human-readable numbers
--
-- WHY THIS FORMAT:
--   Real dashboards often pull data as key-value pairs.
--   This query mimics that pattern.
-- ============================================================

-- Part A: Overall KPIs
SELECT '--- OVERALL KPIs ---' AS section, '' AS metric, '' AS value

UNION ALL

SELECT 'KPI' AS section, 'Total Revenue (excl. cancelled)' AS metric,
    FORMAT((SELECT SUM(total_amount) FROM orders WHERE status != 'Cancelled'), 2) AS value

UNION ALL

SELECT 'KPI', 'Total Orders',
    CAST((SELECT COUNT(*) FROM orders) AS CHAR)

UNION ALL

SELECT 'KPI', 'Cancelled Orders',
    CAST((SELECT COUNT(*) FROM orders WHERE status = 'Cancelled') AS CHAR)

UNION ALL

SELECT 'KPI', 'Cancellation Rate %',
    CONCAT(ROUND((SELECT COUNT(*) FROM orders WHERE status = 'Cancelled') * 100.0 
                / (SELECT COUNT(*) FROM orders), 1), '%')

UNION ALL

SELECT 'KPI', 'Average Order Value',
    FORMAT((SELECT AVG(total_amount) FROM orders WHERE status != 'Cancelled'), 2)

UNION ALL

SELECT 'KPI', 'Total Customers',
    CAST((SELECT COUNT(*) FROM customers) AS CHAR)

UNION ALL

SELECT 'KPI', 'Customers With Orders',
    CAST((SELECT COUNT(DISTINCT customer_id) FROM orders) AS CHAR)

UNION ALL

SELECT 'KPI', 'Unique Products Sold',
    CAST((SELECT COUNT(DISTINCT product_id) FROM order_items) AS CHAR);

-- Part B: Revenue by payment method
SELECT 
    'PAYMENT SPLIT' AS section,
    p.payment_method AS metric,
    CONCAT(FORMAT(SUM(p.amount), 2), ' (', COUNT(*), ' orders)') AS value
FROM payments p
WHERE p.payment_status = 'Completed'
GROUP BY p.payment_method
ORDER BY SUM(p.amount) DESC;

-- Part C: Top 5 products by revenue

<!-- -- ============================================================
-- 🎉 ALL 15 QUERIES COMPLETE!
-- 
-- Summary of concepts covered:
--   ✅ WHERE, Date functions (CURDATE, INTERVAL, DATEDIFF)
--   ✅ Aggregations (SUM, COUNT, AVG, MIN, MAX)
--   ✅ GROUP BY + HAVING
--   ✅ JOINs (INNER JOIN, LEFT JOIN)
--   ✅ Subqueries (scalar, in WHERE, in SELECT)
--   ✅ Window Functions (RANK, LAG)
--   ✅ CTEs (WITH clause, chained CTEs)
--   ✅ CASE expressions
--   ✅ UNION ALL
--   ✅ FORMAT, CONCAT, DATE_FORMAT
--
-- Next file: views_procedures.sql
-- ============================================================ -->
