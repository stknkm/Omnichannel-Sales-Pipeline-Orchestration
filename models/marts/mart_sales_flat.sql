-- models/marts/mart_sales_flat.sql

SELECT
    fs.transaction_id,
    fs.transaction_date,
    dd.is_weekend,

    dp.product_key,
    dp.product_name,
    dp.category,
    fs.channel,
    
    ds.store_location,
    ds.store_id,
    
    fs.price,
    fs.quantity,
    fs.revenue
  

FROM {{ ref('fact_sales') }} fs

LEFT JOIN {{ ref('dim_dates') }} dd 
  ON fs.date_key = dd.date_key

LEFT JOIN {{ ref('dim_products') }} dp 
  ON fs.product_key = dp.product_key

LEFT JOIN {{ ref('dim_stores') }} ds 
  ON fs.store_key = ds.store_key


