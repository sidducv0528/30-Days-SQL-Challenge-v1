# 🚀 Days 25 - 27: The Home Stretch (Assignments & Case Studies)

This section of the challenge focused on transitioning from basic syntax to **applied business logic**. I completed a series of intensive assignments designed to simulate real-world data requests.

---

## 📅 Day 25: Data Cleaning & Validation
*Focus: Ensuring data integrity before analysis.*
- **Task:** Cleaned inconsistent string formats and handled `NULL` values in the transaction tables.
- **Key Query:** Used `COALESCE()` and `TRIM()` to standardize the dataset.
- **Outcome:** Reduced data errors by ensuring all primary keys were unique and formatted correctly.

## 📅 Day 26: Advanced Aggregations
*Focus: Summarizing complex datasets for management.*
- **Task:** Created a "Monthly Performance Report" for the `Product` and `Location` tables.
- **Key Query:** Combined `GROUP BY` with `HAVING` filters to identify underperforming regions.
- **Outcome:** Generated a summary showing which products contributed to 80% of the total revenue (Pareto Principle).

## 📅 Day 27: Subqueries & CTEs (Common Table Expressions)
*Focus: Making complex code readable.*
- **Task:** Refactored long, nested queries into clean, modular CTEs.
- **Key Query:** Used `WITH` statements to calculate running totals and month-over-month growth.
- **Outcome:** Improved query performance and made the logic much easier for teammates to audit.

---

## 🛠️ Tools & Techniques Used
* **Joins:** Multi-table `LEFT JOIN` to connect Sales with Product categories.
* **Logic:** `CASE WHEN` statements to categorize sales into "High," "Medium," and "Low" tiers.
* **Math:** Calculated Profit Margins using: 
  $$\text{Margin \%} = \frac{\text{Sales} - \text{Cost}}{\text{Sales}} \times 100$$

---

## ✅ Status: Assignments Completed
All queries for these days have been tested and verified against the provided CSV datasets.

---
*Moving forward to the final interview prep!*
