#Requête 11 :  Commerciaux ayant conclu le plus de transactions
SELECT 
    oi.seller_id,
    COUNT(o.order_id) AS transactions_conclues
FROM 
    `causal-howl-455709-g0.olist.olist_orders` o
JOIN 
    `causal-howl-455709-g0.olist.olist_order_items` oi
    ON o.order_id = oi.order_id
WHERE 
    o.order_status = 'delivered'
GROUP BY 
    oi.seller_id
ORDER BY 
    transactions_conclues DESC
    limit  20 ;

