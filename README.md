# Retail Omnichannel Sales Pipeline

## Project Overview

This project provides a comprehensive end-to-end data pipeline solution for a mid-sized retailer, aiming to unify its **online (Shopify)** and **in-store (Walmart)** sales data. The goal is to provide a single source of truth for all sales metrics, enabling data-driven decisions on inventory, pricing, and marketing strategies.

The pipeline is built on a modern data stack, leveraging **Snowflake** for data warehousing, **dbt Core** for data transformation and modeling, and **Google Looker Studio** for interactive visualization.

---

## Business Case

Operating across multiple sales channels presents a major challenge in data fragmentation. This project addresses this by:  

- **Tracking Revenue Across Channels**: Comparing online vs. in-store performance in real time.  
- **Identifying Best-Selling Products**: Determining top products overall and by channel to optimize inventory stocking.  
- **Reducing Operational Inefficiencies**: Eliminating manual reconciliation of separate reports, saving time, and reducing errors.  
- **Unifying Disparate Data Sources**: Integrating Shopify e-commerce and Walmart in-store data into a centralized data warehouse.

---

## Data Pipeline Architecture

The pipeline follows a standard Extract, Load, and Transform (ELT) workflow:

1. **Extract & Load**: Raw sales data from Walmart (CSV) and Shopify (JSON) is ingested daily and loaded into staging tables in Snowflake.  
2. **Transform & Model (dbt Core)**: dbt is used to clean, standardize, and transform the raw data. The core of this layer is a **star schema** model that includes a `fact_sales` table and dimension tables (`dim_products`, `dim_stores`, `dim_dates`).  
3. **Visualization (Google Looker Studio)**: The cleaned and modeled data is connected to Google Looker Studio to create an interactive dashboard for business stakeholders.

---

## Exploratory Data Analysis (EDA) & Key Findings

### Overall Sales Performance

- **Total Revenue**: $30.90 million  
- **Total Orders**: 55.0K  
- **Products Sold**: 114.6K  
- **Average Price per Product**: $235.65  

### Channel Performance (Shopify vs. Walmart)

- **Revenue**: Shopify ~$15M, Walmart slightly below $15M  
- **Quantity Sold**: Shopify ~100K units, Walmart ~12.5K units  
- **Temporal Trends**: Walmart revenue declined sharply starting **September 2024**, while Shopify remained stable.

### Product Performance

- **Category Breakdown**: Electronics 68.6% of total revenue, Appliances 31.4%  
- **Top Products by Revenue**: TV, Laptop, Fridge, Washing Machine, Tablet  
- **Category-Specific Trends**: Walmart's revenue drop mainly due to Appliances.

---

## Dashboard Insights
./Dashboard.png
---

## Conclusions & Future Steps

The implemented data pipeline successfully unifies sales data from disparate sources, providing a clear, holistic view of business performance. Key insights include the dominance of Electronics sales and the abrupt decline in Walmart performance in late 2024.  

Future steps could include:  

- **Granular Analysis**: Investigate the cause of the revenue drop in Walmart by analyzing the data by store location or product category.  
- **Demand Forecasting**: Utilize `forecasted_demand` and `actual_demand` columns to build more accurate predictive models for inventory management.  
- **Marketing Campaign Analysis**: Combine sales data with marketing spend to measure ROI across channels.
