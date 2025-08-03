WITH source AS (
    SELECT * 
    FROM {{ source('snowflake', 'shopify_raw') }}
)

SELECT
    order_id,
    sku,
    INITCAP(TRIM(product_name)) AS product_name_clean,
    CASE 
            WHEN INITCAP(TRIM(product_name)) = 'Tv' THEN 'Electronics'
            WHEN category = 'ELEC' THEN 'Electronics'
            WHEN category = 'APPL' THEN 'Appliances'
            ELSE 'Unknown'
        END AS category_clean,
    customer_email,
    order_date,
    quantity,
    price,
    channel,
    year,
    week
FROM source
