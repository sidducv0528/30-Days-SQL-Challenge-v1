# 📅Day 29: SQL Case Study - Advanced Data Analysis

##  Objective
The goal of today's challenge is to perform a deep-dive analysis into the provided datasets to extract actionable business insights.
This involves joining multiple tables, handling null values, and using advanced SQL functions to solve complex business logic.

---

## 📂 Data Dictionary
This project utilizes four primary files:

| File Name | Description |

| **fact.csv** | Contains transactional data including Sales, Cost, Margin, and Date. |
| **Location.csv** | Master data for store locations, including City, State, and Territory. |
| **Product.csv** | Product-level details including Product Type and Product Name. |
| **Case_Study_Details.pdf** | The formal problem statement and business requirements. |

---

## 🛠️ Key SQL Skills Applied
- **Multi-table Joins:** Connecting Fact, Location, and Product tables.
- **Aggregations:** Using `SUM()`, `AVG()`, and `COUNT()` to measure performance.
- **Data Filtering:** Using `WHERE` and `HAVING` for specific segment analysis.
- **Window Functions:** (If applicable) `RANK()` or `ROW_NUMBER()` for top-performing products.

---

##  Business Questions Addressed
*  What is the total revenue generated per state?
*  Which product category has the highest profit margin?
*  Are there any specific locations underperforming in sales?

---

##  How to Use These Files
1. **Import:** Load the `.csv` files into your SQL environment (MySQL, PostgreSQL, etc.).
2. **Schema:** Use the `CREATE TABLE` scripts to define data types.
3. **Analyze:** Run the queries provided in the `day_29_queries.sql` file.

---
*Created as part of the 30-Day SQL Challenge v1.*
