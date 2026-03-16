# Northwind-SQL
SQL analysis of Northwind Traders dataset using BigQuery

I used BigQuery to analyze sales and operations data from Northwind Traders, a fictional food trading company. The goal was to uncover insights that could inform marketing and business decisions.

Tools used: SQL, Google BigQuery

================================================================

Problem: On-time delivery rate.

Question: What percentage of orders were shipped before the required date?

Result: 769 out of 830 orders where delivered on time. That's 92,7% efficiency rate.

Insight: Northwind Traders has a strong on track record.

================================================================

Problem: Revenue by product category.

Question: Which product category generates the most revenue?

Result: Beverages is the highest revenue category at $267868.18.

Insight: Marketing budgets should prioritize beverage promotions and campaigns.

================================================================

Problem: Quarterly revenue trends in the beverages category.

Question: Which quarter generates the highest revenue in beverages category?

Result: Most profitable quarters were : Q1 of 1998 with $89606.13, Q1 of 1997 with $35386.88 and Q4 of 1996 with $34781.22.

Insight: Q1 of 1998 was by far the most profitable quarter for beverages, generating $89,606 — a 153% increase over the second highest quarter (Q1 of 1997 at $35,387). This significant spike stands out significantly from other quarters and raises the question of what drove such a dramatic increase in beverage sales.

================================================================

Problem: Purchasing patterns in the beverage category.

Question: Which product categories are most frequently purchased alongside beverages?

Result: The top 3 categories bought together with beverages are: Confections (149 times, $190,895), 
Seafood (145 times, $142,001) and Dairy Products (142 times, $196,582).

Insight: Confections is the most frequently paired category with beverages, suggesting customers naturally combine sweet treats with drinks. Interestingly, despite Dairy Products ranking 3rd in purchase frequency, it generates the highest combined revenue at $196,582 meaning dairy+beverage combinations are high value transactions even if slightly less frequent. This presents a clear marketing opportunity: bundling beverage with confections and dairy products could increase average order value by capitalizing from existing customer purchasing behaviour.

Important note:Combined with the earlier finding that Q1 consistently drives the highest beverage revenue, marketing bundle campaigns featuring beverages with confections and dairy products would be most impactful when launched at the start of the year

================================================================

Problem: Analyzing the pattern of purchasing beverages together with confectionery and dairy products by shipping country.

Result: USA and Germany dominate beverage related combinations shopping pattern in all filter searches.

Insight: Germany and the USA consistently appear as the top markets when analyzing beverage purchases combined with confections and dairy products, confirming the strong cross-category demand in these regions. This supports the earlier insight that confections are the most frequently paired category with beverages, while dairy–beverage combinations generate higher transaction value despite slightly lower purchase frequency. In both markets, customers regularly add sweets or dairy items to beverage purchases, indicating clear consumption occasions such as snacking or breakfast. These patterns reinforce the opportunity to introduce beverage bundles with confections and dairy products, especially during Q1 when beverage revenue is at its peak, to maximize average order value.

================================================================
