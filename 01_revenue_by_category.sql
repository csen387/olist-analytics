SELECT p.category,
       COUNT(DISTINCT oi.order_id)            AS orders,
       ROUND(SUM(oi.price), 0)                AS product_revenue,
       ROUND(SUM(oi.price + oi.freight_value), 0) AS total_revenue,
       ROUND(100.0 * SUM(oi.price) / SUM(SUM(oi.price)) OVER (), 1) AS pct_of_revenue
FROM order_items_clean oi
JOIN products_clean p ON oi.product_id = p.product_id
JOIN orders_clean o   ON oi.order_id = o.order_id
WHERE o.order_status NOT IN ('canceled', 'unavailable')
GROUP BY p.category
ORDER BY product_revenue DESC
LIMIT 10
