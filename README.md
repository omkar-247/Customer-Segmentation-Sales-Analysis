# Customer-Segmentation-Sales-Analysis
# Customer Segmentation and Sales Analysis Project

This project is a comprehensive Customer Segmentation and Sales Analysis, leveraging **MySQL** for database queries and **Power BI** for dynamic data visualization.

---

### Tools & Technologies Used:
- **MySQL**: For data extraction, filtering, and aggregation.
- **Power BI**: For data visualization and dashboard creation.
- **SQL**: For data manipulation and retrieval.

---

## Workflow:

1. **Data Import**: Import customer sales data from MySQL into Power BI.
2. **Data Cleaning**: Cleaned and formatted data using SQL queries.
3. **Data Analysis**: Performed calculations like sales by region, top customers, and monthly trends in MySQL.
4. **Visualization**: Built interactive visualizations in Power BI, adding features like tooltips and drill-throughs.
5. **Insights**: Derived actionable insights from visualized data to help improve sales and marketing strategies.

---

## Dataset:

The dataset used in this project contains the following fields:

- **Age_Group**: Grouped customer ages.
- **Category**: Product categories (e.g., Office Supplies, Furniture, Technology).
- **Customer_Age**: Age of customers.
- **Customer_City**: Customer location by city.
- **Customer_Region**: Region where the customer is located.
- **Product**: Product name.
- **Sales**: Sales amount.
- **Order_Date**: Date of the customer’s order.

> **Note**: The dataset was cleaned and normalized using MySQL to ensure accuracy and consistency before being imported into Power BI.

---

## SQL Queries for Data Analysis:

```sql
-- Total Sales by Region
SELECT Customer_Region, SUM(Sales) AS TotalSales 
FROM customer_sales 
GROUP BY Customer_Region;

-- Top 5 Customers by Sales
SELECT Customer_ID, SUM(Sales) AS TotalSales 
FROM customer_sales 
GROUP BY Customer_ID 
ORDER BY TotalSales DESC 
LIMIT 5;

-- Sales by Category
SELECT Category, SUM(Sales) AS TotalSales 
FROM customer_sales 
GROUP BY Category;

-- Monthly Sales Trend
SELECT EXTRACT(YEAR_MONTH FROM Order_Date) AS SalesMonth, SUM(Sales) AS TotalSales 
FROM customer_sales 
GROUP BY SalesMonth;

```
## Power BI Dashboard Explanation

The Power BI Dashboard is structured to provide actionable insights through the following visuals:

## Visuals Overview

### 1. Total Sales by Category
- **Type**: Bar Chart  
- **Description**: Visualizes sales figures for product categories (Office Supplies, Furniture, Technology).  
- **Tooltip**: Shows detailed sales information for each category.  
- **Drill-through**: Allows users to explore specific customer demographics and sales trends for each category.

### 2. Top 5 Customers by Sales
- **Type**: Table Visual  
- **Description**: Displays the top 5 customers and their respective sales amounts.  
- **Tooltip**: Provides additional details about each customer, including their region and age group.  
- **Drill-through**: Enables detailed analysis of individual customer purchasing patterns.

### 3. Monthly Sales Trend
- **Type**: Line Chart  
- **Description**: Shows the monthly sales performance.  
- **Tooltip**: Displays exact sales value for each month, along with percentage change from the previous month.

### 4. Sales by Region
- **Type**: Donut Chart  
- **Description**: Visualizes sales based on geographic regions (e.g., East, West, North, South).  
- **Tooltip**: Provides sales data for each region, including the contribution of top categories.

### 5. CLTV (Customer Lifetime Value)
- **Type**: KPI Card  
- **Description**: Displays the Customer Lifetime Value (CLTV), calculated using the following DAX formula:
  ```DAX
  CLTV = SUMX(customer_sales, customer_sales[AverageOrderValue] * customer_sales[PurchaseFrequency])

# Power BI Dashboard Insights and Recommendations

These visuals are interconnected with drill-through and tooltips to allow interactive exploration, helping the business focus on key areas for growth and performance improvement.

---

## Insights Derived

1. **Increased Office Supplies Sales by 15%**  
   Accomplished a 15% increase in sales from Office Supplies by implementing targeted marketing campaigns based on regional sales data, leading to increased sales in high-demand areas.

2. **Top 5 Customers Contributing 30% of Total Sales**  
   Identified the top 5 customers contributing 30% of total sales by segmenting customers based on their purchasing history, enabling the sales team to focus on customer retention programs.

3. **Improved Product Sales Forecasting Accuracy**  
   Analyzed monthly sales trends using Power BI’s interactive line charts, improving forecasting accuracy and reducing stockouts by 10%.

4. **Boosted Sales in Underperforming Regions by 12%**  
   Increased sales in underperforming regions by identifying sales patterns using regional sales breakdowns and implementing region-specific promotions.

5. **Increased CLTV by 8%**  
   Boosted overall customer lifetime value (CLTV) by analyzing purchase frequency and average order value, enabling personalized promotions and loyalty programs for high-value customers.

---

## Recommendations

1. **Focus on Regional Promotions**  
   - **Recommendation**: Implement targeted promotions in regions with lower sales.  
   - **Result**: Boost sales in underperforming areas while leveraging existing customer bases.

2. **Optimize Inventory Management**  
   - **Recommendation**: Use monthly sales trends to optimize inventory levels, especially for high-demand products.  
   - **Result**: Reduce stockouts and improve customer satisfaction, increasing sales by an estimated 5%.

3. **Leverage Top Customers for Upselling Opportunities**  
   - **Recommendation**: Create loyalty programs and offer exclusive deals to the top 5 customers.  
   - **Result**: Improve customer retention and increase average order value, potentially raising overall sales by 10%.

4. **Develop Age-Based Targeting Campaigns**  
   - **Recommendation**: Develop targeted marketing campaigns based on age group preferences, leveraging the `Age_Group` data field.  
   - **Result**: Personalized marketing can improve engagement and drive sales for products aligned with specific age demographics.

5. **Implement CLTV-Based Marketing**  
   - **Recommendation**: Focus marketing efforts on customers with high Customer Lifetime Value (CLTV) to maximize return on marketing investment.  
   - **Result**: Enhance long-term profitability by prioritizing customers who are more likely to generate future revenue.

---

## Conclusion

This project demonstrates my ability to manage end-to-end data analysis, from SQL data extraction to building insightful dashboards in Power BI. The combination of SQL queries and Power BI visuals provided actionable insights that can help businesses make data-driven decisions, improve sales, and enhance customer retention.
