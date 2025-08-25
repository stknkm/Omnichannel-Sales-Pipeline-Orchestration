Retail Omnichannel Sales Pipeline
Project Overview
This project provides a comprehensive end-to-end data pipeline solution for a mid-sized retailer aiming to unify its online (Shopify) and in-store (Walmart) sales data. The goal is to provide a single source of truth for all sales metrics, enabling data-driven decisions on inventory, pricing, and marketing strategies.

The pipeline is built on a modern data stack, leveraging Snowflake for data warehousing, dbt Core for data transformation and modeling, and Google Looker Studio for interactive visualization.

Business Case
Operating across multiple sales channels presents a major challenge in data fragmentation. This project addresses this by:


Tracking Revenue Across Channels: Comparing online vs. in-store performance in real time.




Identifying Best-Selling Products: Determining top products overall and by channel to optimize inventory stocking.




Reducing Operational Inefficiencies: Eliminating manual reconciliation of separate reports, saving time, and reducing errors.




Unifying Disparate Data Sources: Integrating Shopify e-commerce and Walmart in-store data into a centralized data warehouse.



Data Pipeline Architecture
The pipeline follows a standard Extract, Load, and Transform (ELT) workflow:

Extract & Load: Raw sales data from Walmart (CSV) and Shopify (JSON) is ingested daily and loaded into staging tables in Snowflake.

Transform & Model (dbt Core): dbt is used to clean, standardize, and transform the raw data. The core of this layer is a star schema model that includes:

fact_sales: A fact table containing transactional-level data.

dim_products: A dimension table with standardized product information.

dim_stores: A dimension table for Walmart store locations.

dim_dates: A dimension table for temporal analysis.

Visualization (Google Looker Studio): The cleaned and modeled data is connected to Google Looker Studio to create an interactive dashboard for business stakeholders. This dashboard allows for easy analysis of sales trends and key performance indicators.

Exploratory Data Analysis (EDA) & Key Findings
An initial analysis of the unified dataset revealed several key insights that guided the data model design.

1. Overall Sales Performance

Total Revenue: The project dataset represents a total revenue of $30.90 million.


Total Orders: A total of 55.0K orders were processed.


Average Price: The average price per product sold is $235.65.

2. Channel Performance (Shopify vs. Walmart)

Revenue: Both Shopify and Walmart contribute significantly to total revenue, with each bringing in approximately $15 million.




Quantity Sold: Shopify sold a far greater quantity of products, nearly 100,000 units, compared to Walmart's approximately 12,500 units. This indicates that Walmart's transactions have a higher average price per item.




Temporal Trends: While Walmart's revenue was consistently higher than Shopify's for the first part of the year, a sharp decline was observed in Walmart's sales starting in September 2024, while Shopify's revenue remained stable.


3. Product Performance

Category Breakdown: Electronics are the dominant category, making up 68.6% of total revenue, with Appliances accounting for the remaining 31.4%.




Top Products: The top five products by revenue are TV, Laptop, Fridge, Washing Machine, and Tablet.






Category-Specific Trends: The significant drop in Walmart's revenue in September is reflected in the sales of Appliances, which saw a similar sharp decline during the same period.

Dashboard Insights


Conclusions & Future Steps
The implemented data pipeline successfully unifies sales data from disparate sources, providing a clear, holistic view of business performance. The visualizations reveal critical insights, such as the dominance of Electronics sales and the abrupt decline in Walmart's performance in late 2024. These findings allow the business to investigate potential operational issues, such as a supply chain disruption or a change in in-store strategy, to address the sharp drop in Walmart revenue.

Future steps could include:

Granular Analysis: Investigating the cause of the revenue drop in Walmart, potentially by analyzing the data by store location or product category in more detail.

Demand Forecasting: Utilizing the forecasted_demand and actual_demand columns in the Walmart dataset to build more accurate predictive models for inventory management.

Marketing Campaign Analysis: Combining sales data with marketing spend to measure the ROI of different campaigns across channels.
