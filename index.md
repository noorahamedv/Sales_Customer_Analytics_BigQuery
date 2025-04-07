# 📈 Sales & Customer Analytics Project

![BigQuery](https://www.google.com/search?sca_esv=4f7b8728d565568a&rlz=1C1ONGR_enUS1150US1150&sxsrf=AHTn8zpmTgZDL-g7pBJP7IqCPMjDwj-dcw:1744041505925&q=google+bigquery&udm=2&fbs=ABzOT_CWdhQLP1FcmU5B0fn3xuWpA-dk4wpBWOGsoR7DG5zJBnsX62dbVmWR6QCQ5QEtPRrN1KFHti9EP_dqC742rxzHNYrK4aIGJt-VBGd9a6Cy3PUCVIbXOXyNSMm1nLumVA1DyqdUISZJ0S_wUr3-nFgn9UzXPNT8B_yEJyltoYwlFo9_sJAdocaQrGORfK7dw_gP3vKq0YUTYEbVGeVCacy50s4k_Q&sa=X&sqi=2&ved=2ahUKEwjjoLzzpMaMAxUnSjABHVEzMgMQtKgLegQIGxAB&biw=1349&bih=592&dpr=1.42#vhid=-stNIVY-6-MLNM&vssid=mosaic)

Welcome to the project site for my Google BigQuery-based customer and sales analytics pipeline. Built from scratch using SQL, BigQuery, and Kaggle datasets.

---

## 🔄 ETL Overview

- Uploaded `sales.csv` and `customer.csv` to Google BigQuery
- Created denormalized tables using SQL joins
- Aggregated category, region, and gender-based insights

---

## 🧪 Sample Queries

```sql
SELECT category, SUM(quantity) 
FROM customer_sales_data 
GROUP BY category 
ORDER BY 2 DESC LIMIT 5;
