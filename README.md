# Retail Omnichannel Sales Pipeline

## Project Overview

This project provides a comprehensive end-to-end data pipeline solution for a mid-sized retailer aiming to unify its online (Shopify) and in-store (Walmart) sales data. The goal is to provide a single source of truth for all sales metrics, enabling data-driven decisions on inventory, pricing, and marketing strategies.

The pipeline is built on a modern data stack, leveraging **Snowflake** for data warehousing, **dbt Core** for data transformation and modeling, and **Google Looker Studio** for interactive visualization.

## Business Case

Operating across multiple sales channels presents a major challenge in data fragmentation. This project addresses this by:
* [cite_start]**Tracking Revenue Across Channels**: Comparing online vs. in-store performance in real time[cite: 55].
* [cite_start]**Identifying Best-Selling Products**: Determining top products overall and by channel to optimize inventory stocking[cite: 55].
* [cite_start]**Reducing Operational Inefficiencies**: Eliminating manual reconciliation of separate reports, saving time, and reducing errors[cite: 55].
* [cite_start]**Unifying Disparate Data Sources**: Integrating Shopify e-commerce and Walmart in-store data into a centralized data warehouse[cite: 55].

## Data Pipeline Architecture

The pipeline follows a standard Extract, Load, and Transform (ELT) workflow:

1.  [cite_start]**Extract & Load**: Raw sales data from Walmart (CSV) and Shopify (JSON) is ingested daily and loaded into staging tables in Snowflake[cite: 55].
2.  **Transform & Model (dbt Core)**: dbt is used to clean, standardize, and transform the raw data. [cite_start]The core of this layer is a **star schema** model that includes a `fact_sales` table and dimension tables (`dim_products`, `dim_stores`, `dim_dates`)[cite: 55].
3.  [cite_start]**Visualization (Google Looker Studio)**: The cleaned and modeled data is connected to Google Looker Studio to create an interactive dashboard for business stakeholders[cite: 55].

---

## Exploratory Data Analysis (EDA) & Key Findings

An initial analysis of the unified dataset revealed several key insights:

### Overall Sales Performance

* [cite_start]**Total Revenue**: The project dataset represents a total revenue of **$30.90 million**[cite: 2].
* [cite_start]**Total Orders**: A total of **55.0K orders** were processed[cite: 3].
* [cite_start]**Products Sold**: **114.6K products** were sold in total[cite: 4].
* [cite_start]**Average Price**: The average price per product sold is **$235.65**[cite: 5].

### Channel Performance (Shopify vs. Walmart)

* [cite_start]**Revenue**: The bar chart shows Shopify with revenue just over **$15M**, and Walmart slightly below **$15M**[cite: 37, 43, 49, 56, 55].
* [cite_start]**Quantity Sold**: Shopify sold a far greater quantity of products, nearly **100K units**, compared to Walmart's approximately **12.5K units**[cite: 37, 39, 41, 50, 56].
* [cite_start]**Temporal Trends**: While Walmart's revenue was consistently higher than Shopify's for the first part of the year, a sharp decline was observed in Walmart's sales starting in **September 2024**, while Shopify's revenue remained stable[cite: 1, 33].

### Product Performance

* [cite_start]**Category Breakdown**: Electronics are the dominant category, making up **68.6%** of total revenue, with Appliances accounting for the remaining **31.4%**[cite: 31, 65, 66].
* [cite_start]**Top Products**: The top five products by revenue are **TV**, **Laptop**, **Fridge**, **Washing Machine**, and **Tablet**[cite: 37].
* [cite_start]**Category-Specific Trends**: The significant drop in Walmart's revenue in September is reflected in the sales of **Appliances**, which saw a similar sharp decline during the same period[cite: 30, 33].

---

## Dashboard Insights

![Omnichannel Sales Dashboard]

---

## Conclusions & Future Steps

The implemented data pipeline successfully unifies sales data from disparate sources, providing a clear, holistic view of business performance. [cite_start]The visualizations reveal critical insights, such as the dominance of Electronics sales and the abrupt decline in Walmart's performance in late 2024. These findings allow the business to investigate potential operational issues, such as a supply chain disruption or a change in in-store strategy, to address the sharp drop in Walmart revenue[cite: 1].

Future steps could include:
* [cite_start]**Granular Analysis**: Investigating the cause of the revenue drop in Walmart by analyzing the data by store location or product category in more detail[cite: 64].
* [cite_start]**Demand Forecasting**: Utilizing the `forecasted_demand` and `actual_demand` columns to build more accurate predictive models for inventory management[cite: 55].
* **Marketing Campaign Analysis**: Combining sales data with marketing spend to measure the ROI of different campaigns across channels.
