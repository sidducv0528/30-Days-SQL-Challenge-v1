SQL Constraints practice (NOT NULL, CHECK, DEFAULT, UNIQUE, PRIMARY KEY, FOREIGN KEY)

# SQL Constraints (Day 7–10)

This folder covers SQL Constraints practiced during Days 7 to 10.

## Topics Covered
- NOT NULL
- CHECK
- DEFAULT
- UNIQUE
- PRIMARY KEY
- FOREIGN KEY

Database used: SQL Server (Zoho)

# 🔗 Days 7 - 10: Connecting the Dots (The Join Phase)

If the first week was about learning to read, this week was about learning to have a conversation. I moved from single tables to connecting multiple datasets to find the "hidden" answers.

---

## 💡 The Journey: Making Connections

### 🤝 Day 7: The Inner Join (The Perfect Match)
I learned that tables are like puzzle pieces. `INNER JOIN` is only interested in the pieces that fit perfectly together.
* **The "Aha!" moment:** Realizing that `Orders` and `Customers` are useless without each other. 
* **The Win:** Writing my first query that pulled a customer's name and their total order value in one go.

### ⬅️ Day 8: Left & Right Joins (The "No One Left Behind" Rule)
This was tricky. I learned how to keep all records from one table even if they didn't have a match in the other.
* **The Struggle:** Understanding why my results had `NULL` values everywhere—and then realizing those `NULLs` were actually telling me a story (like a customer who hasn't placed an order yet!).

### 🗺️ Day 9: Multi-Table Joins (The Web)
Things got messy! I learned to join three or more tables (Fact -> Product -> Location).
* **The Lesson:** **Aliasing** is your best friend. Without `AS`, my code looked like a bowl of alphabet soup.
* **Pro-Tip:** Always map out the "Primary Key" to "Foreign Key" relationship before typing a single line of code.



### 🔄 Day 10: Union vs. Join
I finished the block by learning the difference between adding columns (Joins) and adding rows (`UNION`). 
* **Key takeaway:** Joins make your data *wider*; Unions make your data *longer*.

---

## 🛠️ Skills I’ve Sharpened
* **Relational Thinking:** I can now visualize how a store's inventory, sales, and staff tables all "talk" to each other.
* **Data Auditing:** Using `LEFT JOIN` to find missing data or "orphaned" records.
* **Patience:** Joining the wrong columns usually results in a "Cartesian Product" (millions of rows!)—I learned to double-check my `ON` clause every single time.

---

## 📈 Weekly Reflection
**Status:** I no longer see tables; I see a network.
**Current Mood:** 🧠 Brain is expanding. Joins aren't scary anymore; they're logical.
**Looking Forward:** Heading into **Advanced Filtering and Case Statements** next!

