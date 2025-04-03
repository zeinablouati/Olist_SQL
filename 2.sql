SELECT 
    c.customer_city, 
    pc.product_category_name_english, 
    COUNT(DISTINCT o.order_id) AS total_orders, -- Nombre total de commandes
    COUNT(DISTINCT c.customer_unique_id) AS total_customers, -- Nombre total de clients uniques
    SUM(oi.price) AS revenue -- Chiffre d'affaires total
FROM 
    `causal-howl-455709-g0.olist.olist_orders` o
JOIN 
    `causal-howl-455709-g0.olist.olist_customers` c 
    ON o.customer_id = c.customer_id
JOIN 
    `causal-howl-455709-g0.olist.olist_order_items` oi 
    ON o.order_id = oi.order_id
JOIN 
    `causal-howl-455709-g0.olist.products_category` pc 
    ON oi.product_id = pc.product_id
GROUP BY 
    c.customer_city, pc.product_category_name_english
ORDER BY 
    revenue DESC;
