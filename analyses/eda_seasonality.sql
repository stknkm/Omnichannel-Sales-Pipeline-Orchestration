SELECT
  d.month,
  
  f.channel,
  SUM(f.revenue) AS revenue
FROM {{ ref('fact_sales') }} f
JOIN {{ ref('dim_dates') }} d ON f.date_key = d.date_key
GROUP BY d.month,f.channel
ORDER BY d.month