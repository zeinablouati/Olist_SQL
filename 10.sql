#Requête 10 : Transactions conclues un samedi
SELECT 
    COUNT(`o`.`order_id`) AS `transactions_samedi`
FROM 
    `causal-howl-455709-g0.olist.olist_orders` o
WHERE 
    `o`.`order_status` = 'delivered'
    AND FORMAT_DATE('%A', DATE(`o`.`order_purchase_timestamp`)) = 'Saturday';
