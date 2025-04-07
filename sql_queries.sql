-- Create customer_sales_data table 
CREATE TABLE project_id.dataset.customer_sales_data
  ( customer_id STRING, category STRING, quantity INT64, 
  price FLOAT64, total_price FLOAT64, invoice_date DATE, shopping_mall STRING, 
  gender STRING, age INT64, payment_method STRING );

-- Populate customer_sales_data 
INSERT INTO project_id.dataset.customer_sales_data 
  SELECT s.customer_id, s.category, s.quantity, s.price, s.quantity * s.price AS total_price, 
  s.invoice_date, s.shopping_mall, c.gender, c.age, c.payment_method FROM project_id.dataset.sales_staging AS s 
  JOIN project_id.dataset.customer_staging AS c ON c.customer_id = s.customer_id;

-- Query: Total Revenue in 2023 
SELECT SUM(total_price) AS total_revenue FROM project_id.dataset.customer_sales_data 
  WHERE EXTRACT(YEAR FROM invoice_date) = 2023;

-- Query: Top 5 categories by quantity 
SELECT category, SUM(quantity) AS total_quantity FROM project_id.dataset.customer_sales_data 
  GROUP BY category ORDER BY total_quantity DESC LIMIT 5;

-- Query: Revenue by gender 
SELECT gender, SUM(total_price) AS revenue FROM project_id.dataset.customer_sales_data 
  GROUP BY gender;
