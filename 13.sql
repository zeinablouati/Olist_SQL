#Requête 13 : Secteurs dactivité ayant conclu le plus de transactions
SELECT 
    lc.business_segment,
    COUNT(o.order_id) AS transactions_conclues
FROM 
    `causal-howl-455709-g0.olist.olist_orders` o
JOIN 
    `causal-howl-455709-g0.olist.olist_order_items` oi 
    ON o.order_id = oi.order_id
JOIN 
    `causal-howl-455709-g0.olist.olist_sellers` os
    ON oi.seller_id = os.seller_id
JOIN 
    `causal-howl-455709-g0.olist.leads_closed` lc
    ON os.seller_id = lc.seller_id
WHERE 
    o.order_status = 'delivered'
GROUP BY 
    lc.business_segment
ORDER BY 
    transactions_conclues DESC;


