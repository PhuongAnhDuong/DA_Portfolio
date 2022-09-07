# DA_Portfolio
Hi, I'm Phuong Anh. I have experience in conducting both quantitative and qualitative research to gain insights from the data, answering business questions for businesses in Tech and Banking industry.  

This is a repository to showcase skills, share projects and track my progress in Data Analytics related topics.

# [SQL](https://github.com/PhuongAnhDuong/DA_Portfolio/tree/main/SQL)
## Ecommerce Analysis

Code: [Ecommerce Analysis](https://github.com/PhuongAnhDuong/DA_Portfolio/blob/main/SQL/Ecommerce_project.sql).


Description: The sample dataset provides an obfuscated Google Analytics 360 dataset that can be accessed via BigQuery. Google Merchandise Store is a real ecommerce store. It includes the following kinds of information:

- Traffic source data: information about where website visitors originate. 
- Content data: information about the behavior of users on the site. 
- Transactional data: information about the transactions that occur on the Google Merchandise Store website.

The project involves performing data analysis for real world business metrics such as:

- Total visit, pageview, transaction and revenue per week, month
- Average number of product pageviews by purchaser type (purchasers vs non-purchasers)
- Products purchased by customers who purchased product A 
- Cohort map from pageview to addtocart to purchase
etc.

# [Power BI](https://github.com/PhuongAnhDuong/DA_Portfolio/tree/main/Power%20BI)

## Telecom User Churn Analysis

Power BI Dashboard: [Dashboard](https://github.com/PhuongAnhDuong/DA_Portfolio/blob/main/Power%20BI/User%20Churn%20Analysis/Churn%20Analysis%20Dashboard%20.pbix)

Dashboard canvas: [Dashboard canvas](https://github.com/PhuongAnhDuong/DA_Portfolio/blob/main/Power%20BI/User%20Churn%20Analysis/Churn%20Analysis%20Dashboard.pdf)

Description: The project includes the following steps: data loading, data cleaning and preprocessing, filling missing values, EDA (exploratory data analysis),  measuring statistical factors, data visualization. 

Skills: data cleaning, data analysis, descriptive statistics, data visualization.

Results: created an analytical dashboard to analyse user churn at a telecom company.

### Insights and Recommendations:

#### Insights

Demographic	

- The number of churners is 1796, accounting for more than 1/4 of total number of users. 														
- About 83% churners are senior citizen, in both gender.										-n0-1 year subscribers are those who cancelled their subscription the most( 992 users cancelled, 3.4 times higher than 1-2 year subscribers). The graph also indicated that  the longer users use our service, the fewer chances they will churn, from 992 cancellations (0-1 year subscribers) to 6 cancellation (6-7 year subscribers).													
- Regarding churning reasons, 805 churners accounting for 44% of total churners cited “Competitors product and offers” is the number 1 churning reason. Among churn reasons in this category, the most common reasons are competitors have better offers and better devices.
- The 2 second most popular service cancelling reasons are the attitude of service provider, supporters and dissatisfied product quality (591 churners in total)

Phone services	

- Churners has a big preference for usually subscribed for unlimited data plan (80%) and only 1/3 used device protection & backup. 

- In general, churners spend more time on local calling (from 40 to 699 minutes) than international calling (from 41 to 446 minutes). The calling time increases as their subscription increase.				

Contract		

- Most of churners signed month-to month contract (1579/1796 users) with payperless payment methods such as direct debit (1277/1796 users - 71%) favoured the most followed by Credit card (378/1796 users - 21%).	

#### Recommendations														
Based on demographic and services analysis, the company should focus on user retention strategy targeting 0-1 year subscribers, senior citizen in both gender.									
Based on churn reasons, the company should conduct more competitor analysis to create a more appealing offer as well as improve product reliability, attitude and expertise of the supporting service & sales team.

## Global Superstore Sales
Power BI Dashboard: [Dashboard](https://github.com/PhuongAnhDuong/DA_Portfolio/blob/main/Power%20BI/Global%20Superstore%20Sales/Global%20Superstore%20Sales%20Analysis%20Dashboard.pbix)

Dashboard canvas: [Dashboard canvas](https://github.com/PhuongAnhDuong/DA_Portfolio/blob/main/Power%20BI/Global%20Superstore%20Sales/Global%20Superstore%20Sales%20Analysis.pdf)

Description: The project includes the following steps: data loading, data cleaning and preprocessing, filling missing values, EDA (exploratory data analysis),  measuring statistical factors, data visualization. 

Skills: data cleaning, data analysis, descriptive statistics, data visualization.

Results: created an analytical dashboard about sales and find out potential products
### Insights and Recommendations:

#### Insight
General business situation

- In general, company's revenue increased steadily from 2011 to 2014 with a compound annual growth rate (CAGR) of 17.46%. On a closer look, sales of all catergories increased throughout the year but reduced sharply at the beginning of the following year, suggesting the sales is highly seasonal.
- Gross Profit Margin remained stable around 11% over the course of 4 years.
- The value of orders has not changed much over the years, while the number of orders tends to increase sharply (1.7 times by 2014), leading to a general uptrend for the company's revenue.
- The value of returned orders increased slightly over the years with the average value being 1.3 times higher than successful orders. Returned orders mostly appeared in APAC (32%), US(22%), EU(25%) and LATAM(20%) market.
- B2C customer group is the main revenue generating group for the company (51%), followed by Corporate (30%) and Home Office. However, in recent years, revenue from this group has been on a slight downward trend. Revenue structure in 2014 shows that the Home Office customer group tends to increase

Market

- The top 3 largest markets are APAC (3.59M - 28.36% of sales ), EU (2.94M - 23.24% of sales) and US (2.3M - 18.17% of sales). The sales proportions of three categories are evenly distributed in most markets, but Technology products ranked first.
- Popular products in these markets are Bookcases, Phones, Chairs respectively. In EU, however, Copier brought in the largest revenue.
- In terms of compound annual growth rate (CAGR), the Canadian market is having the strongest growth (28.45%) followed by Africa (22.14%) despite being two smallest market. The US market (one of the three major markets) has the growth rate is the slowest (10%) ,
- By country, the US is the country bringing in the largest revenue (2.2M), 2.4 times higher than the second country.

Product

- The company's product lines are seasonal, with revenue increasing sharply at the end of the year.
- Technology and Office Supplies have the largest proportion of Gross Profit Margin (13.99% and 13.69%), double the Furniture industry with a margin of only 6.94%.
- The following Sub-category products brought the largest revenue: Phones (1.7M), Copiers (1.5M), Chairs (1.5M), Bookcase (1.4M).
- The following Sub-category products have the highest Profit Margin: Paper (24.24%), Labels (20.45%), Envelopes (17.32%), Accessories (17.29%), Copier (17.13%). However, among them, only Copier and Accessories had high sales. The remaining products are in the group of 5 products with the lowest revenue in the whole company.
- Particularly, Tables is a product with negative Profit Margin (8.46%) although the revenue is fairly good (749K).

#### Recommendations:
- Conduct a research for sales drop at the beginning of the year to develop a revised business development strategy.
- Keep the recent business strategy in major markets such as APAC, EU, meanwhile develop the right development strategy of potential markets (high CAGR) such as Canada and Africa. For a big market with high inertia like US, it is recommned to design a new business strategy to tackle the issue and accelerate revenue growth.
- Increase marketing activities in the 3rd and 4th quarters, focusing on potential products (Low Sales but High Profit Margin) such as Accessories, Art, Papers, Evelopes besides Phones, Bookcases, Copier groups, Chair which are inherently the strength of the company.
- Besides, promoting upsale and cross-sale activities to increase order value.
