SELECT payment_type,
       COUNT(*)                                          AS payments,
       ROUND(100.0 * COUNT(*) / SUM(COUNT(*)) OVER (), 1) AS pct_of_payments,
       ROUND(SUM(payment_value), 0)                      AS total_value
FROM order_payments_clean
GROUP BY payment_type
ORDER BY payments DESC
