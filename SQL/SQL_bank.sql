SQL
-- ============================================================
-- 0. SAMPLE VIEW
-- ============================================================

# See all customers and columns (sample)
SELECT *
FROM `banking-analytics-suite.banking.banking`
LIMIT 10;


-- ============================================================
-- 1. BASIC DISTRIBUTIONS
-- ============================================================

# Distribution of churners vs non-churners
SELECT 
  Attrition_Flag, 
  COUNT(*) AS num_customers
FROM `banking-analytics-suite.banking.banking`
GROUP BY Attrition_Flag;

# Count per attrition category
SELECT 
  Attrition_Flag,
  COUNT(*) AS total_customers
FROM `banking-analytics-suite.banking.banking`
GROUP BY Attrition_Flag;

# Churn Rate Percentage
SELECT 
  ROUND(
    SUM(CASE WHEN Attrition_Flag ='Attrited Customer' THEN 1 ELSE 0 END) 
    / COUNT(*) * 100, 2
  ) AS churn_rate_percentage
FROM `banking-analytics-suite.banking.banking`;


-- ============================================================
-- 2. BASIC STATS (AGE / CREDIT / TRANSACTIONS)
-- ============================================================

# Basic statistics on age, credit card limit and transactions
SELECT 
    AVG(Customer_Age) AS avg_age,
    MIN(Customer_Age) AS min_age,
    MAX(Customer_Age) AS max_age,
    AVG(Credit_Limit) AS avg_credit_limit,
    MIN(Credit_Limit) AS min_credit_limit,
    MAX(Credit_Limit) AS max_credit_limit,
    AVG(Total_Trans_Amt) AS avg_total_trans_amt,
    MIN(Total_Trans_Amt) AS min_total_trans_amt,
    MAX(Total_Trans_Amt) AS max_total_trans_amt
FROM `banking-analytics-suite.banking.banking`;

# Average Age per Attrition Group
SELECT 
  Attrition_Flag, 
  ROUND(AVG(Customer_Age), 2) AS avg_age
FROM `banking-analytics-suite.banking.banking`
GROUP BY Attrition_Flag;


-- ============================================================
-- 3. DEMOGRAPHICS
-- ============================================================

# Gender distribution per group
SELECT
  Attrition_Flag, 
  Gender, 
  COUNT(*) AS total
FROM `banking-analytics-suite.banking.banking`
GROUP BY Attrition_Flag, Gender
ORDER BY Attrition_Flag, Gender;


-- ============================================================
-- 4. INCOME & CARD CATEGORIES
-- ============================================================

# Customer distribution by Income_Category
SELECT 
  Income_Category, 
  COUNT(*) AS num_customers
FROM `banking-analytics-suite.banking.banking`
GROUP BY Income_Category
ORDER BY num_customers DESC;

# Customer distribution by Card_Category
SELECT 
  Card_Category, 
  COUNT(*) AS num_customers
FROM `banking-analytics-suite.banking.banking`
GROUP BY Card_Category
ORDER BY num_customers DESC;

# Churn per Income_Category
SELECT 
  Income_Category, 
  COUNT(*) AS total_customers,
  SUM(CASE WHEN Attrition_Flag = 'Attrited Customer' THEN 1 ELSE 0 END) AS attrited_customers,
  ROUND(
    SUM(CASE WHEN Attrition_Flag = 'Attrited Customer' THEN 1 ELSE 0 END) 
    / COUNT(*) * 100, 2
  ) AS churn_rate_percentage
FROM `banking-analytics-suite.banking.banking`
GROUP BY Income_Category
ORDER BY churn_rate_percentage DESC;

# Churn per Card_Category
SELECT 
  Card_Category, 
  COUNT(*) AS total_customers,
  SUM(CASE WHEN Attrition_Flag = 'Attrited Customer' THEN 1 ELSE 0 END) AS attrited_customers,
  ROUND(
    SUM(CASE WHEN Attrition_Flag = 'Attrited Customer' THEN 1 ELSE 0 END)
    / COUNT(*) * 100, 2
  ) AS churn_rate_percentage
FROM `banking-analytics-suite.banking.banking`
GROUP BY Card_Category
ORDER BY churn_rate_percentage DESC;


-- ============================================================
-- 5. ENGAGEMENT & ACTIVITY
-- ============================================================

# Average customer duration (Months_on_book)
SELECT 
  Attrition_Flag,
  AVG(Months_on_book) AS avg_months_on_book
FROM `banking-analytics-suite.banking.banking`
GROUP BY Attrition_Flag;

# Average credit line per churn status
SELECT 
  Attrition_Flag,
  AVG(Credit_Limit) AS avg_credit_limit
FROM `banking-analytics-suite.banking.banking`
GROUP BY Attrition_Flag;

# Transaction count & transaction amount
SELECT 
  Attrition_Flag,
  AVG(Total_Trans_Ct) AS avg_trans_count,
  AVG(Total_Trans_Amt) AS avg_trans_amount
FROM `banking-analytics-suite.banking.banking`
GROUP BY Attrition_Flag;

# Total_Relationship_Count
SELECT
  Attrition_Flag,
  AVG(Total_Relationship_Count) AS avg_relationships
FROM `banking-analytics-suite.banking.banking`
GROUP BY Attrition_Flag;

# Months_Inactive_12_mon
SELECT
  Attrition_Flag,
  AVG(Months_Inactive_12_mon) AS avg_inactive_months
FROM `banking-analytics-suite.banking.banking`
GROUP BY Attrition_Flag;

# Contacts_Count_12_mon
SELECT
  Attrition_Flag,
  AVG(Contacts_Count_12_mon) AS avg_contacts
FROM `banking-analytics-suite.banking.banking`
GROUP BY Attrition_Flag;


-- ============================================================
-- 6. FULL TABLE DUMP (optional)
-- ============================================================

SELECT *
FROM `banking-analytics-suite.banking.banking`;