-- models/marts/mart_top_products.sql

-- This model aggregates product sales and adds more performance metrics.
-- It supports reporting on top products by revenue, quantity, AOV, etc.

SELECT
    dp.product_name,
    dp.category,
    s.channel,

   
    COUNT(DISTINCT s.transaction_id) AS order_count,
    SUM(s.quantity) AS total_quantity,
    SUM(s.revenue) AS total_revenue,
    ROUND(
        CASE WHEN SUM(s.quantity) > 0 THEN SUM(s.revenue) / SUM(s.quantity)
             ELSE 0 END, 2
    ) AS average_price,

    

FROM {{ ref("fact_sales") }} s

LEFT JOIN {{ ref("dim_products") }} dp 
  ON s.product_key = dp.product_key

GROUP BY 
    dp.product_name,
    dp.category,
    s.channel


