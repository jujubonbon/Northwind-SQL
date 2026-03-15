 =============================================
   Northwind Traders - Marketing Analysis
   Tool: BigQuery 
 =============================================

- Problem: On-time delivery rate
- Question: What percentage of orders were shipped before the required date?

SELECT
  COUNT(*) AS total_orders,
  COUNTIF(shippedDate != 'NULL' AND CAST(shippedDate AS DATETIME) < CAST(requiredDate AS DATETIME)) AS on_time,
  ROUND(COUNTIF(shippedDate != 'NULL' AND CAST(shippedDate AS DATETIME) < CAST(requiredDate AS DATETIME)) * 100.0 / COUNT(*), 1) AS on_time_percentage
FROM `my-portfolio-project-490314.Northwind_Traders.Orders`

=============================================
  Result: 830 total orders, 769 on time = 92.7% on time delivery rate
