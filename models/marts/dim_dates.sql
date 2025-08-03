-- models/dim_dates.sql

-- This model generates a simple date dimension (dim_dates)
-- based on distinct transaction dates from the `int_sales` model.
WITH distinct_dates AS (
    SELECT DISTINCT transaction_date
    FROM {{ ref('int_sales') }}
    WHERE transaction_date IS NOT NULL
)

SELECT
    {{ dbt_utils.generate_surrogate_key(['transaction_date']) }} AS date_key,
    transaction_date,
    
    EXTRACT(YEAR FROM transaction_date) AS year,
    EXTRACT(MONTH FROM transaction_date) AS month,
    EXTRACT(DAY FROM transaction_date) AS day,
    
    EXTRACT(DAYOFWEEK FROM transaction_date) AS weekday_number,

    TO_CHAR(transaction_date, 'DY') AS weekday_name,  
    
    INITCAP(TRIM(TO_CHAR(transaction_date, 'Mon'))) AS month_name,

    CONCAT('Q', EXTRACT(QUARTER FROM transaction_date)) AS quarter,

    CASE 
        WHEN EXTRACT(DAYOFWEEK FROM transaction_date) IN (0, 6) THEN TRUE 
        ELSE FALSE 
    END AS is_weekend

FROM distinct_dates