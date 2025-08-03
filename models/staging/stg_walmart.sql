with source as (select * from {{ source("snowflake", "walmart_raw") }})

select
    to_date(to_timestamp(transaction_date, 'MM/DD/YYYY HH24:MI')) as transaction_date,
    cast(transaction_id as varchar) as transaction_id,
    customer_id,
    cast(product_id as varchar) as product_id,
    initcap(trim(product_name)) as product_name_clean,

    case
        when
            initcap(trim(product_name)) in (
                'Tv',
                'Smartphone',
                'Laptop',
                'Tablet',
                'Camera',
                'Headphones'
        
            )
        then 'Electronics'
        when
            initcap(trim(product_name))
            in ('Fridge', 'Dishwashing Machine', 'Washing Machine')
        then 'Appliances'
        
    end as category_clean,

    unit_price,
    quantity_sold,
    store_id,
    store_location,
    inventory_level,
    reorder_point,
    reorder_quantity,
    supplier_id,
    supplier_lead_time,
    customer_age,
    customer_gender,
    customer_income,
    customer_loyalty_level,
    payment_method,
    promotion_applied,
    promotion_type,
    weather_conditions,
    holiday_indicator,
    weekday,
    stockout_indicator,
    forecasted_demand,
    actual_demand

from source
