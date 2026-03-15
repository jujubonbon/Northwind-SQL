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

  
- Result: 830 total orders, 769 on time = 92.7% on time delivery rate
=============================================
  
- Problem: Revenue by product category
- Question: Which product category generate the most revenue?

  
SELECT c.categoryName,
round(sum (o.unitPrice*o.quantity*(1-o.discount)),2) as total_revenue 
from 
`my-portfolio-project-490314.Northwind_Traders.Categories` c
inner join `my-portfolio-project-490314.Northwind_Traders.Products` p
on p.categoryID=c.categoryID
inner join `my-portfolio-project-490314.Northwind_Traders.Order_details` o
on o.productID=p.productID
group by c.categoryName
order by  total_revenue desc

  
- Result: Most profitable product category is beverages with $ 267868.18 profit.

=============================================
