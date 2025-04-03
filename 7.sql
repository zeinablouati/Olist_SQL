 SELECT 
    q.*, 
    c.*
FROM 
    causal-howl-455709-g0.olist.leads_qualified q
LEFT JOIN 
    causal-howl-455709-g0.olist.leads_closed c 
    ON q.mql_id = c.mql_id;