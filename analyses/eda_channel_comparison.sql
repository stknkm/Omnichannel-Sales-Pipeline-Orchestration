SELECT
  channel,
  COUNT(*) AS total_orders,
  SUM(revenue) AS total_revenue,
  AVG(revenue) AS avg_order_value
FROM {{ ref('fact_sales') }}

GROUP BY channel