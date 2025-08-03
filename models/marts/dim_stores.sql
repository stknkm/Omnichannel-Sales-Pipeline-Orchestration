
WITH source_data AS (
    SELECT DISTINCT 
        store_id,
        store_location
    FROM {{ ref('stg_walmart') }}
)

SELECT
    {{ dbt_utils.generate_surrogate_key(['store_id', 'store_location']) }} AS store_key,
    store_id,
    store_location
FROM source_data
ORDER BY store_id