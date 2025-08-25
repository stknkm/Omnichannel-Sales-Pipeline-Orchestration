# retail_project

## 📌 Project Overview
This project implements an **omnichannel sales analytics pipeline** that unifies **Shopify e-commerce** and **Walmart in-store** sales data into a single source of truth.  
The goal is to give a retailer a **360° view of sales performance**, customer behavior, and inventory trends across online and offline channels.

## 🎯 Business Context
- Retailers operate across **multiple sales channels** (online + offline).  
- Omnichannel strategies increase customer retention (**89% vs 33%**).  
- Key challenge: **data fragmentation** across platforms.  
- This project integrates disparate datasets for **better decisions on pricing, promotions, and inventory**.

## 🏗️ Architecture
- **Data Ingestion**:  
  - Shopify CSV files (online orders)  
  - Walmart CSV files (in-store sales)  
- **Data Warehouse**: PostgreSQL / Snowflake (staging → transformations → marts)  
- **Transformation**: dbt Core (models: staging, intermediate, marts)  
- **Visualization**: Google Looker Studio dashboard  

Workflow: **Extract → Load → Transform → Visualize**

## 🖼️ Data Pipeline Architecture

```mermaid
flowchart LR
    subgraph Sources
        A[Shopify\n(CSV)] 
        B[Walmart\n(CSV)]
    end

    subgraph Data_Warehouse[Data Warehouse\n(Postgres / Snowflake)]
        C[Staging\n(stg_shopify, stg_walmart)]
        D[Intermediate\n(int_sales)]
        E[Fact & Dimensions\n(fact_sales, dim_products, dim_stores, dim_dates)]
        F[Mart\n(mart_sales_flat)]
    end

    subgraph Analytics
        G[Looker Studio\nDashboard]
    end

    A --> C
    B --> C
    C --> D
    D --> E
    E --> F
    F --> G



retail_project/
├── models/
│   ├── staging/        # stg_shopify, stg_walmart
│   ├── intermediate/   # int_sales
│   ├── marts/          # fact_sales, dim_dates, dim_products, dim_stores, mart_sales_flat
│   └── tests/          # data quality & revenue consistency tests
├── seeds/              # sample raw data (CSV)
├── macros/             # reusable dbt macros
└── README.md           # project documentation
