4-
SELECT 
    AVG(order_total) AS average_cart_value -- Panier moyen
FROM (
    SELECT 
        o.order_id, 
        SUM(oi.price) AS order_total -- Total dépensé par commande
    FROM 
        `causal-howl-455709-g0.olist.olist_orders` o
    JOIN 
        `causal-howl-455709-g0.olist.olist_order_items` oi 
        ON o.order_id = oi.order_id
    GROUP BY 
        o.order_id
);
