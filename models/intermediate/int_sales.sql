

SELECT
        transaction_id,
        transaction_date,
        product_id,
        product_name_clean AS product_name,
        category_clean AS category,
        quantity_sold AS quantity,
        unit_price AS price,
        'walmart' AS channel,
        store_id,
        store_location,
        DATE_PART('week', TO_DATE(transaction_date)) AS week,
        DATE_PART('year', TO_DATE(transaction_date)) AS year
    FROM {{ ref('stg_walmart') }}
    
    UNION ALL

    SELECT
        order_id AS transaction_id,
        order_date AS transaction_date,
        sku  AS product_id,
        product_name_clean AS product_name,
        category_clean AS category,
        quantity,
        price,
        channel,
        NULL AS store_id,
        NULL AS store_location,
        week,
        year
    FROM {{ ref('stg_shopify') }}
