# Banking-Churn-Analysis
# Banking Customer Churn Analysis

## Overview
This project analyzes customer churn in a banking dataset from the **Banking Analytics Suite**.  
It provides insights into customer behavior, demographics, account activity, and product usage to help understand factors contributing to churn.  

The project is designed for **data analysts** and **business stakeholders** to explore and visualize trends and patterns in customer attrition. The next phase will include building a **predictive model** to forecast churn.

---

## Dataset
The dataset contains anonymized customer information including:
- Demographics: `Gender`, `Income_Category`, `Customer_Age`
- Account Info: `Credit_Limit`, `Card_Category`, `Months_on_book`
- Engagement: `Total_Trans_Ct`, `Total_Trans_Amt`, `Total_Relationship_Count`, `Months_Inactive_12_mon`, `Contacts_Count_12_mon`
- Churn status: `Attrition_Flag`

---

## SQL Queries
All SQL queries used to explore and summarize the dataset are included in `banking_queries.sql`. They cover:
1. Overview of all customers
2. Distribution of churners vs non-churners
3. Basic statistics on age, credit limits, and transactions
4. Customer distribution by `Income_Category` and `Card_Category`
5. Average metrics per churn status (`Age`, `Credit_Limit`, `Transactions`, `Relationships`, `Activity`)
6. Churn rate percentages per income category and card category

These queries were executed in **BigQuery**.

---

## Visualizations
Visualizations were created in **Power BI**, including:
1. **Customer Distribution by Attrition Status** – Pie chart
2. **Churn per Gender** – Bar chart
3. **Churn per Income Category** – Bar chart
4. **Median Credit Limit by Attrition and Gender** – Bar chart
5. **Average Transaction Activity by Customer Status and Income Category** – Bar chart
6. **Average Utilization Ratio per Attrition Flag and Card Category** – Bar chart

Visualizations are organized in a **3x2 grid** layout for readability. Colors, axis titles, and legends were customized to reflect a banking context.

---

## Next Steps
- Develop a **predictive model** (e.g., Logistic Regression, Random Forest) to forecast churn based on the existing features.
- Explore **feature importance** to identify the strongest predictors of churn.
- Deploy dashboards and visualizations for ongoing monitoring and decision-making.

---

## Notes
- This project is intended for educational and portfolio purposes.
- All customer data is anonymized and synthetic where applicable.
