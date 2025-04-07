Sales & Customer Analytics with Google BigQuery

This project showcases a cloud-native analytics pipeline built using Google BigQuery, analyzing structured customer and sales datasets sourced from Kaggle. It combines transactional and demographic data to uncover insights on top-selling product categories, customer behavior by gender and age, and sales performance across different shopping malls.

The project includes data upload, SQL-based transformations (ETL), and business-driven querying. Results were visualized using BigQuery’s charting tools and exported to Google Sheets for interactive reporting.

## 📂 Project Overview
- Imported and staged CSV files of `sales` and `customer` data into BigQuery.
- Performed ETL operations to **denormalize** the data and create a final fact table.
- Ran SQL queries to answer key business questions like:
  - Most popular product categories
  - Total revenue in a given year
  - Customer segmentation by age, gender, and payment method
- Used **BigQuery’s chart preview** and **Google Sheets export** for visual analysis.

## 🧪 Tech Stack
- Google BigQuery
- SQL (Standard)
- Google Cloud Platform (GCP)
- Google Colab
- CSV Dataset from [Kaggle](https://www.kaggle.com/datasets/dataceo/sales-and-customer-data?select=sales_data.csv)

## 📊 Key SQL Highlights
```sql
-- Create the final customer_sales_data table
CREATE TABLE `project_id.dataset.customer_sales_data` (
  customer_id STRING,
  category STRING,
  quantity INT64,
  price FLOAT64,
  total_price FLOAT64,
  invoice_date DATE,
  shopping_mall STRING,
  gender STRING,
  age INT64,
  payment_method STRING
);

-- Join staging tables to create final denormalized dataset
INSERT INTO `project_id.dataset.customer_sales_data`
SELECT
  s.customer_id,
  s.category,
  s.quantity,
  s.price,
  s.quantity * s.price AS total_price,
  s.invoice_date,
  s.shopping_mall,
  c.gender,
  c.age,
  c.payment_method
FROM `project_id.dataset.sales_staging` AS s
JOIN `project_id.dataset.customer_staging` AS c
ON c.customer_id = s.customer_id;
