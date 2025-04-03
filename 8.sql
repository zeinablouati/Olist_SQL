#Requête 8 : Taux de conversion entre les transactions conclues et les prospects qualifiés
SELECT
    COUNT(DISTINCT c.mql_id) AS prospects_closed, -- Nombre de prospects convertis en transactions conclues
    COUNT(DISTINCT q.mql_id) AS total_prospects,  -- Nombre total de prospects qualifiés
    ROUND((COUNT(DISTINCT c.mql_id) / COUNT(DISTINCT q.mql_id)) * 100, 2) AS conversion_rate -- Taux de conversion
FROM 
    `causal-howl-455709-g0.olist.leads_qualified` q
LEFT JOIN 
    `causal-howl-455709-g0.olist.leads_closed` c 
    ON q.mql_id = c.mql_id;
