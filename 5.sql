5- 
WITH review_avg AS (
    SELECT 
        order_id, 
        AVG(review_score) AS review_score -- Si une commande a plusieurs avis, on prend la moyenne
    FROM causal-howl-455709-g0.olist.olist_order_reviews
    GROUP BY order_id
)
SELECT 
    r.review_score, 
    ROUND(AVG(c.order_total), 2) AS average_cart_value -- Panier moyen arrondi à 2 décimales
FROM (
    SELECT 
        oi.order_id, 
        SUM(oi.price + oi.freight_value) AS order_total -- Total du panier (prix + frais)
    FROM causal-howl-455709-g0.olist.olist_order_items oi
    GROUP BY oi.order_id
) c
JOIN review_avg r 
ON c.order_id = r.order_id
GROUP BY r.review_score
ORDER BY r.review_score;
