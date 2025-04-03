1--- Création d'une vue pour afficher les produits avec les noms de catégories en anglais
CREATE VIEW products_category AS
SELECT 
    p.product_id,
    t.string_field_1 AS product_category_name_english, -- Traduction en anglais
    p.product_name_lenght,
    p.product_description_lenght,
    p.product_photos_qty,
    p.product_weight_g,
    p.product_length_cm,
    p.product_height_cm,
    p.product_width_cm
FROM 
    `causal-howl-455709-g0.olist.olist_products` p
LEFT JOIN 
    `causal-howl-455709-g0.olist.product_category_name_translation` t
ON 
    p.product_category_name = t.string_field_0;

