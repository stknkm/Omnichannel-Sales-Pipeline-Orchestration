

WITH base AS (
    SELECT
        s.transaction_date,
        s.channel,
        COUNT(DISTINCT s.transaction_id) AS orders,
        SUM(s.quantity) AS total_quantity,
        SUM(s.revenue) AS total_revenue,
        COUNT(DISTINCT dp.product_key) AS unique_products,
        COUNT(DISTINCT CASE WHEN s.channel = 'walmart' THEN ds.store_key END) AS unique_stores
    FROM {{ ref('fact_sales') }} s
    LEFT JOIN {{ ref('dim_products') }} dp ON s.product_key = dp.product_key
    LEFT JOIN {{ ref('dim_stores') }} ds ON s.store_key = ds.store_key
    GROUP BY 1, 2
),

final AS (
    SELECT
        transaction_date,
        channel,
        orders,
        total_quantity,
        total_revenue,
        ROUND(CASE WHEN orders > 0 THEN total_revenue / orders ELSE 0 END, 2) AS avg_order_value,
        unique_products,
        unique_stores
    FROM base
)

SELECT * FROM final