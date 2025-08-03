SELECT
    s.transaction_id,
    s.transaction_date,
    dp.product_key,
    dp.sku,
    dd.date_key,
    CASE WHEN s.channel = 'walmart' THEN ds.store_key ELSE NULL END AS store_key,
    s.quantity,
    s.price,
    s.quantity * s.price AS revenue,
    s.channel
FROM {{ ref('int_sales') }} s

-- Join with dim_products
LEFT JOIN {{ ref('dim_products') }} dp
  ON s.product_id  = dp.sku 
  AND s.product_name = dp.product_name
  AND s.category = dp.category
  AND s.channel = dp.source_system

-- Join with dim_stores
LEFT JOIN {{ ref('dim_stores') }} ds
  ON s.store_id = ds.store_id
  AND s.store_location = ds.store_location

-- Join with dim_dates
LEFT JOIN {{ ref('dim_dates') }} dd
  ON s.transaction_date = dd.transaction_date

