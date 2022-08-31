-- Big project for SQL

-- Query 01: calculate total visit, pageview, transaction and revenue for Jan, Feb and March 2017 order by month
#standardSQL
SELECT
format_date("%Y%m", parse_date("%Y%m%d", date)) as month,
	count(totals.visits) as visits, 
	sum(totals.pageviews) as pageview,
	sum(totals.transactions) as transaction, 
	sum(totals.totalTransactionRevenue)/POWER(10,6) as revenue
FROM `bigquery-public-data.google_analytics_sample.ga_sessions_*`
WHERE _table_suffix between '20170101' and '20170331' 
GROUP BY month
ORDER BY month


-- Query 02: Bounce rate per traffic source in July 2017
#standardSQL
SELECT trafficSource.source as source, 
        COUNT(totals.visits) as totals_visits, 
        COUNT(totals.bounces) as total_no_of_bounces,
        COUNT(totals.bounces)*100/COUNT(totals.visits) as bounce_rate
FROM `bigquery-public-data.google_analytics_sample.ga_sessions_201707*`
GROUP BY trafficSource.source
ORDER BY COUNT(totals.visits) DESC


-- Query 3: Revenue by traffic source by week, by month in June 2017
#standardSQL

WITH SUMWEEK AS
(SELECT  
        --"Week" as Time_type
        format_date("%Y%W", parse_date("%Y%m%d", date)) as time,
        trafficSource.source,
        sum(totals.totalTransactionRevenue)/ POWER(10,6) as revenue
FROM `bigquery-public-data.google_analytics_sample.ga_sessions_201706*`
GROUP BY  trafficSource.source, time
order by revenue desc),

SUMMONTH AS 
(SELECT  
        --"Month" as Time_type
        format_date("%Y%m", parse_date("%Y%m%d", date)) as time,
        trafficSource.source,
        sum(totals.totalTransactionRevenue)/ POWER(10,6) as revenue
FROM `bigquery-public-data.google_analytics_sample.ga_sessions_201706*`
GROUP BY  trafficSource.source, time
order by revenue desc),

SUMALL AS
(SELECT 
CASE WHEN time BETWEEN '201722' AND '201726' THEN 'Week'
      ELSE 'Month' END AS Time_type, *
FROM SUMWEEK
UNION ALL
SELECT CASE WHEN time = '201706' THEN 'Month'
      ELSE 'Month' END AS Time_type, * 
FROM SUMMONTH)

SELECT *
FROM SUMALL
ORDER BY SUMALL.revenue DESC

--Query 04: Average number of product pageviews by purchaser type (purchasers vs non-purchasers) in June, July 2017. Note: totals.transactions >=1 for purchaser and totals.transactions is null for non-purchaser
#standardSQL
WITH PURC AS
(SELECT SUM (totals.pageviews)/ COUNT (DISTINCT fullVisitorId) as avg_pageviews_purchase,
        format_date("%Y%m", parse_date("%Y%m%d", date)) as month
FROM `bigquery-public-data.google_analytics_sample.ga_sessions_*`
WHERE _table_suffix between '20170601' and '20170731'
AND totals.transactions >=1
GROUP BY month),

NONPURC AS
(SELECT SUM (totals.pageviews)/ COUNT (DISTINCT fullVisitorId) as avg_pageviews_non_purchase,
        format_date("%Y%m", parse_date("%Y%m%d", date)) as month
FROM `bigquery-public-data.google_analytics_sample.ga_sessions_*`
WHERE _table_suffix between '20170601' and '20170731'
AND totals.transactions IS NULL
GROUP BY month)

SELECT PURC.month,PURC.avg_pageviews_purchase, NONPURC.avg_pageviews_non_purchase
FROM PURC
LEFT JOIN NONPURC
ON PURC.month=NONPURC.month


-- Query 05: Average number of transactions per user that made a purchase in July 2017
#standardSQL
SELECT 
      format_date("%Y%m", parse_date("%Y%m%d", date)) as month,
      SUM (totals.transactions)/ COUNT (DISTINCT fullVisitorId) as Avg_total_transactions_per_user
FROM `bigquery-public-data.google_analytics_sample.ga_sessions_201707*`
WHERE totals.transactions >=1
GROUP BY month

-- Query 06: Average amount of money spent per session
#standardSQL
SELECT 
      format_date("%Y%m", parse_date("%Y%m%d", date)) as month,
      SUM (totals.totalTransactionRevenue)/ COUNT (fullVisitorId) as Avg_total_transactions_per_user
FROM `bigquery-public-data.google_analytics_sample.ga_sessions_201707*`
WHERE totals.transactions IS NOT NULL
GROUP BY month


-- Query 07: Products purchased by customers who purchased product A (Classic Ecommerce)
#standardSQL
SELECT v2ProductName AS other_purchased_products,
     SUM(product.productQuantity) AS quantity
FROM `bigquery-public-data.google_analytics_sample.ga_sessions_201707*`,
  UNNEST (hits) hits,
  UNNEST (hits.product) product
WHERE hits.transaction.transactionId IN 
(SELECT DISTINCT hits.transaction.transactionId
FROM
  `bigquery-public-data.google_analytics_sample.ga_sessions_201707*`,
  UNNEST (hits) hits,
  UNNEST (hits.product) product
WHERE v2ProductName ="YouTube Men's Vintage Henley" AND product.productRevenue IS NOT NULL) AND v2ProductName <> "YouTube Men's Vintage Henley"
GROUP BY other_purchased_products
ORDER BY quantity DESC


--Query 08: Calculate cohort map from pageview to addtocart to purchase in last 3 month. For example, 100% pageview then 40% add_to_cart and 10% purchase.
#standardSQL
WITH A AS (
SELECT 
CASE WHEN ecommerceaction.action_type = '2' THEN COUNT(product.v2ProductName) END AS num_product_view,
CASE WHEN ecommerceaction.action_type = '3' THEN COUNT(product.v2ProductName) END AS num_addtocart,
CASE WHEN ecommerceaction.action_type = '6' THEN COUNT(product.v2ProductName) END AS num_purchase,
format_date("%Y%m", parse_date("%Y%m%d", date)) as month
FROM
  `bigquery-public-data.google_analytics_sample.ga_sessions_*`,
  UNNEST (hits) hits,
  UNNEST (hits.product) product
WHERE _table_suffix between '20170101' and '20170331' 
GROUP BY month, ecommerceaction.action_type
ORDER BY month ASC)

SELECT month, SUM (num_product_view) as num_product_view,
        SUM(num_addtocart) as num_addtocart, 
        SUM(num_purchase) as num_purchase,
        SUM(num_addtocart)*100/SUM (num_product_view) as add_to_cart_rate,
        SUM(num_purchase)*100/ SUM (num_product_view) as purchase_rate
FROM A
GROUP BY month
ORDER BY month 
