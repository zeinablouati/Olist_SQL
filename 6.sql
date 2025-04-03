6 - 
SELECT 
    r.review_score, 
    ROUND(AVG(o.order_estimated_delivery_date - o.order_delivered_customer_date), 2) AS avg_estimated_delay, -- Délai entre date estimée et date réelle
    ROUND(AVG(o.order_delivered_customer_date - o.order_purchase_timestamp), 2) AS avg_actual_delay -- Délai total de la commande
FROM 
    `causal-howl-455709-g0.olist.olist_orders` o
JOIN 
    `causal-howl-455709-g0.olist.olist_order_reviews` r 
    ON o.order_id = r.order_id
WHERE 
    o.order_delivered_customer_date IS NOT NULL -- Exclure les commandes non livrées
GROUP BY 
    r.review_score
ORDER BY 
    r.review_score;