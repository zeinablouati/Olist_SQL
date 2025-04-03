#Requête 9 : Première et dernière transaction, durée du timelapse
SELECT 
    MIN(o.order_purchase_timestamp) AS first_transaction, -- Première transaction
    MAX(o.order_purchase_timestamp) AS last_transaction,  -- Dernière transaction
    DATE_DIFF(MAX(o.order_purchase_timestamp), MIN(o.order_purchase_timestamp), DAY) AS timelapse_days -- Durée entre la première et dernière transaction
FROM 
    `causal-howl-455709-g0.olist.olist_orders` o;
