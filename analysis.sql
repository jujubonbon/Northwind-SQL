 =============================================
   Northwind Traders - Marketing Analysis
   Tool: BigQuery 
 =============================================

- Problem: On-time delivery rate.
- Question: What percentage of orders were shipped before the required date?

SELECT
  COUNT(*) AS total_orders,
  COUNTIF(shippedDate != 'NULL' AND CAST(shippedDate AS DATETIME) < CAST(requiredDate AS DATETIME)) AS on_time,
  ROUND(COUNTIF(shippedDate != 'NULL' AND CAST(shippedDate AS DATETIME) < CAST(requiredDate AS DATETIME)) * 100.0 / COUNT(*), 1) AS on_time_percentage
FROM `my-portfolio-project-490314.Northwind_Traders.Orders`

  
- Result: 830 total orders, 769 on time = 92.7% on time delivery rate
=============================================
  
- Problem: Revenue by product category.
- Question: Which product category generates the most revenue?

  
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
limit 1
  
- Result: Most profitable product category is beverages with $ 267868.18 profit.

=============================================

- Problem: Quarterly revenue trends in the beverages category.
- Question: Which quarter generates the highest revenue in beverages category?


SELECT 
round(sum(od.unitPrice*od.quantity*(1-od.discount)),2) as total_revenue,
extract(year from cast(ord.orderDate as date)) as sales_year,
extract(quarter from cast(ord.orderDate as date))
as sales_quarter
from `my-portfolio-project-490314.Northwind_Traders.Orders` ord
inner join `my-portfolio-project-490314.Northwind_Traders.Order_details` od
on od.orderID=ord.orderID
inner join `my-portfolio-project-490314.Northwind_Traders.Products` p
on od.productID=p.productID
inner join `my-portfolio-project-490314.Northwind_Traders.Categories` c
on p.categoryID=c.categoryID
where c.categoryName='Beverages'
group by sales_year,sales_quarter
order by total_revenue desc
limit 3

- Result: Most profitable quarters were : Q1 of 1998 with $89606.13, Q1 of 1997 with $35386.88 and Q4 of 1996 with $34781.22.

  =============================================

  - Problem: Purchasing patterns in the beverage category.
  - Question: Which product categories are most frequently purchased alongside beverages?
  

select 
round(sum(a.unitPrice*a.quantity*(1-a.discount)),2)+ round(sum(b.unitPrice*b.quantity*(1-b.discount)),2) as combined_revenue,
count (*) as times_bought_together,
c2.categoryName as paired_category
from `my-portfolio-project-490314.Northwind_Traders.Order_details` a
inner join `my-portfolio-project-490314.Northwind_Traders.Order_details` b 
on a.orderId=b.orderID
and a.productID != b.productID
inner join `my-portfolio-project-490314.Northwind_Traders.Products` p1
on a.productID=p1.productID
inner join `my-portfolio-project-490314.Northwind_Traders.Products` p2
on b.productID=p2.productID
inner join `my-portfolio-project-490314.Northwind_Traders.Categories` c
on p1.categoryID=c.categoryID
INNER JOIN `my-portfolio-project-490314.Northwind_Traders.Categories` c2
ON p2.categoryID = c2.categoryID
where c.categoryName='Beverages'
and c2.categoryNAme!='Beverages'
group by paired_category
order by times_bought_together desc
limit 3


- Results: The top 3 categories bought together with beverages are: Confections (149 times, $190,895), 
  Seafood (145 times, $142,001) and Dairy Products (142 times, $196,582).

=============================================

-Problem: Analyzing the pattern of purchasing beverages together with confectionery and dairy products by shipping country

select 
round(sum(a.unitPrice*a.quantity*(1-a.discount)),2)+ round(sum(b.unitPrice*b.quantity*(1-b.discount)),2) as combined_revenue,Orders.shipCountry,
count (*) as times_bought_together,
c2.categoryName as paired_category
from `my-portfolio-project-490314.Northwind_Traders.Order_details` a
inner join `my-portfolio-project-490314.Northwind_Traders.Order_details` b 
on a.orderId=b.orderID
and a.productID != b.productID
inner join `my-portfolio-project-490314.Northwind_Traders.Products` p1
on a.productID=p1.productID
inner join `my-portfolio-project-490314.Northwind_Traders.Products` p2
on b.productID=p2.productID
inner join `my-portfolio-project-490314.Northwind_Traders.Categories` c
on p1.categoryID=c.categoryID
INNER JOIN `my-portfolio-project-490314.Northwind_Traders.Categories` c2
ON p2.categoryID = c2.categoryID
inner join `my-portfolio-project-490314.Northwind_Traders.Orders` Orders
on b.orderID=Orders.orderID
where c.categoryName='Beverages'
and c2.categoryNAme!='Beverages'
and c2.categoryName = 'Confections'
group by Orders.shipCountry,paired_category
order by times_bought_together desc


 This query was reused with small modifications and filtered 4 times to analyze
product categories bought together.

   Filters applied:
1. Beverages + Confections → Times bought together

   Results: 1st place USA: $35171.23 and 30 times bought together, Germany $60704.7 and 28 times bought together, 
   Venezuela $6913.4 and 9 times bought together
  
2. Beverages + Confections → Total combined revenue

  Resultus: Germany, USA and Danemark with 12329.0 combined revenue and 3 times bought together.
  
3. Beverages + Dairy Products → Times bought together
  
   Results: 1st place USA (34 times bought together with $64863.94), 2nd place Germany (25 times bought together $25007.13), 
   3rd place Austria (15 times bought together with $36290.34)
  
4. Beverages + Dairy Products → Total combined revenue

   USA, Austria, Germany.

=============================================
