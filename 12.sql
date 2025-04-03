#Requête 12 : Nombre de prospects "cat" signés en avril
SELECT 
    COUNT(*) AS cat_prospects_signed_in_april
FROM 
    `causal-howl-455709-g0.olist.leads_closed` c
WHERE 
    c.lead_behaviour_profile = 'cat' 
    AND EXTRACT(MONTH FROM c.won_date) = 4;  -- Avril
