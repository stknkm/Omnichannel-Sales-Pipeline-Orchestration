SELECT
  p.product_name,
  f.channel,
  SUM(f.revenue) AS revenue
FROM {{ ref('fact_sales') }} f
JOIN {{ ref('dim_products') }} p ON f.product_key = p.product_key
GROUP BY p.product_name, f.channel
ORDER BY revenue DESC
--LIMIT 10