# SQL Assignment – Data Engineer Intern (Vetty)

## Project Overview

This repository contains my submission for the **Data Engineer Intern SQL Assignment** provided by Vetty.  
The objective of the assignment was to analyze transaction data, perform data extraction, and answer a set of SQL-based business questions using **MySQL**.

The project demonstrates my ability to:
- Design and query relational databases
- Write optimized SQL queries
- Use window functions, grouping, CTEs, and joins
- Extract business insights from raw data

All queries were executed in **MySQL Workbench** and results have been captured as screenshots and uploaded here.

---

## Tools & Technologies Used

- MySQL Server
- MySQL Workbench
- Notepad (for SQL script)
- GitHub (for submission & version control)

---

## Files in this Repository

| File Name     | Description |
|------------|------------|
| `queries.sql` | Contains all 8 SQL queries (Q1 – Q8) with comments |
| `Q1.png` | Output screenshot for Question 1 |
| `Q2.png` | Output screenshot for Question 2 |
| `Q3.png` | Output screenshot for Question 3 |
| `Q4.png` | Output screenshot for Question 4 |
| `Q5.png` | Output screenshot for Question 5 |
| `Q6.png` | Output screenshot for Question 6 |
| `Q7.png` | Output screenshot for Question 7 |
| `Q8.png` | Output screenshot for Question 8 |

---

## Database Schema

Two tables were used in this project:

### **transactions**
| Column Name | Type |
|------|----|
| buyer_id | INT |
| purchase_time | DATETIME |
| refund_time | DATETIME |
| store_id | VARCHAR |
| item_id | VARCHAR |
| gross_transaction_value | INT |

### **transaction_items**
| Column Name | Type |
|------|----|
| store_id | VARCHAR |
| item_id | VARCHAR |
| item_category | VARCHAR |
| item_name | VARCHAR |

---

##  Questions Solved

The following business questions were answered using SQL:

1. Monthly count of successful purchases (excluding refunds)
2. Number of stores with 5 or more orders in October 2020
3. Minimum time taken for a refund (in minutes) per store
4. First transaction (by time) for each store
5. Most popular item from each user’s first purchase
6. Refund eligibility flag (within 72 hours)
7. Second non-refunded purchase per buyer
8. Second transaction time for each buyer

Each question’s output has been saved as a screenshot for verification.

---

##  How to Run the Queries

1. Open **MySQL Workbench**
2. Select your database:
   ```sql
   USE project;
   ```
3. Open the file `queries.sql`
4. Run each query one by one (Q1 → Q8)
5. Results will appear in the output grid

---

##  Conclusion

This assignment helped strengthen my SQL and database problem-solving skills.  
I applied:
- Window functions (`ROW_NUMBER()`)
- Date functions (`DATE_FORMAT`, `TIMESTAMPDIFF`)
- Aggregations & grouping
- Subqueries & CTEs

This project represents my understanding of data extraction, transformation, and analysis using SQL.

---

##  Author

**Name:** Priyanshu Kumar  
**Role:** Data Engineer Intern Applicant  
**Assignment from:** Vetty 

---

