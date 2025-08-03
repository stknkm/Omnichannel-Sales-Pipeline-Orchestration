-- models/marts/mart_store_performance.sql



SELECT
    ds.store_id,
    ds.store_location,
    s.transaction_date,

   
    SUM(s.quantity) AS total_quantity,
    SUM(s.revenue) AS total_revenue,
    ROUND(
        CASE WHEN SUM(s.quantity) > 0 THEN SUM(s.revenue) / SUM(s.quantity)
             ELSE 0 END, 2
    ) AS average_item_price,
    

FROM {{ ref("fact_sales") }} s

LEFT JOIN {{ ref("dim_stores") }} ds
  ON s.store_key = ds.store_key
WHERE
    s.channel = 'walmart'
GROUP BY 
    ds.store_id,
    ds.store_location,
    s.transaction_date