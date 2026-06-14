USE sales_analytics;

-- Total Revenue
SELECT ROUND(SUM(revenue),2) AS total_revenue
FROM sales;

-- Total Orders
SELECT COUNT(DISTINCT order_id) AS total_orders
FROM sales;

-- Total Customers
SELECT COUNT(DISTINCT customer_unique_id) AS total_customers
FROM sales;

-- Revenue by State
SELECT customer_state,
       ROUND(SUM(revenue),2) AS revenue
FROM sales
GROUP BY customer_state
ORDER BY revenue DESC;

-- Top Categories by Revenue
SELECT product_category_name_english,
       ROUND(SUM(revenue),2) AS revenue
FROM sales
GROUP BY product_category_name_english
ORDER BY revenue DESC
LIMIT 10;

-- Payment Distribution
SELECT payment_type,
       COUNT(*) AS transactions
FROM sales
GROUP BY payment_type
ORDER BY transactions DESC;