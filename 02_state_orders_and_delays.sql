SELECT c.customer_state AS state,
       COUNT(*)                              AS orders,
       ROUND(AVG(o.delivery_days), 1)        AS avg_delivery_days,
       ROUND(AVG(o.delay_days), 1)           AS avg_delay_days,
       ROUND(100.0 * AVG(o.is_late), 1)      AS pct_late
FROM orders_clean o
JOIN customers_clean c ON o.customer_id = c.customer_id
WHERE o.order_status = 'delivered'
GROUP BY c.customer_state
ORDER BY orders DESC
