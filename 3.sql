SELECT 
    s.seller_city, 
    COUNT(oi.order_item_id) AS total_items_sold, -- Nombre total d'articles vendus
    SUM(oi.price) AS revenue -- Chiffre d'affaires total
FROM 
    `causal-howl-455709-g0.olist.olist_order_items` oi
JOIN 
    `causal-howl-455709-g0.olist.olist_sellers` s 
    ON oi.seller_id = s.seller_id
GROUP BY 
    s.seller_city
ORDER BY 
    revenue DESC;
