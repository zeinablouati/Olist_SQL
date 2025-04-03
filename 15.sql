#Requête 15 : 
SELECT
    EXTRACT(YEAR FROM o.order_purchase_timestamp) AS year,
    EXTRACT(MONTH FROM o.order_purchase_timestamp) AS month,
    SUM(oi.price) AS total_revenue  
FROM
    `causal-howl-455709-g0.olist.olist_orders` o
JOIN
    `causal-howl-455709-g0.olist.olist_order_items` oi
    ON o.order_id = oi.order_id
WHERE
    o.order_status = 'delivered'
GROUP BY
    year, month
ORDER BY
    year, month;



