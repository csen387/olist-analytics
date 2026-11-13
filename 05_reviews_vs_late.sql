SELECT CASE WHEN o.is_late = 1 THEN 'Late' ELSE 'On time' END AS delivery,
       COUNT(*)                          AS orders,
       ROUND(AVG(r.review_score), 2)     AS avg_review_score,
       ROUND(100.0 * AVG(CASE WHEN r.review_score <= 2 THEN 1 ELSE 0 END), 1) AS pct_low_reviews
FROM orders_clean o
JOIN order_reviews_clean r ON o.order_id = r.order_id
WHERE o.order_status = 'delivered' AND o.is_late IS NOT NULL
GROUP BY delivery
