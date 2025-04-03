#Requête 14 : Nombre de transactions conclues par timelapse
SELECT
    EXTRACT(YEAR FROM o.order_purchase_timestamp) AS year,
    EXTRACT(MONTH FROM o.order_purchase_timestamp) AS month,
    COUNT(o.order_id) AS transactions_conclues
FROM
    `causal-howl-455709-g0.olist.olist_orders` o
WHERE
    o.order_status = 'delivered'
GROUP BY
    year, month
ORDER BY
    year, month;

