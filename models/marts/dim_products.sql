WITH products_cleaned AS (
    SELECT DISTINCT
        product_name_clean AS product_name,
        sku AS sku,
        category_clean AS category,
        'shopify' AS source_system
    FROM {{ ref('stg_shopify') }}
UNION ALL 
    SELECT DISTINCT
        product_name_clean AS product_name,
        product_id AS sku,
        category_clean AS category,
        'walmart' AS source_system
    FROM {{ ref('stg_walmart') }}
)

SELECT 
    {{ dbt_utils.generate_surrogate_key(['product_name','category', 'sku', 'source_system']) }} AS product_key,
    product_name,
    category,
    sku,
    source_system
FROM products_cleaned

