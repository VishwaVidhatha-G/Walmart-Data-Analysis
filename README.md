# Walmart Data Analysis with SQL

## Overview
This repository focuses on analyzing Walmart's transactional data using SQL. The goal is to extract valuable insights, such as identifying popular payment methods, busiest days, top-performing categories, and profitability trends. The dataset is sourced from Kaggle, processed using Python, and analyzed in PostgreSQL/MySQL.

---

## Tools and Technologies
- **SQL**: For querying and analysis.
- **Python (Pandas)**: For data cleaning and preparation.
- **Database**: PostgreSQL or MySQL for storing and querying data.
- **Development Environment**: VS Code for scripting and pgAdmin for database management.

---

## Data Source
- **Kaggle Dataset**: Walmart transactional data.
  - [Download the dataset here]([https://www.kaggle.com/](https://www.kaggle.com/datasets/vishwavidhatha/walmart)).

---

## Questions Addressed

### 1. Payment Methods
- Identify different payment methods, the number of transactions, and quantities sold for each.

### 2. Top-Rated Categories
- Determine the highest-rated category for each branch based on average ratings.

### 3. Busiest Days
- Find the busiest day for each branch in terms of the number of transactions.

### 4. Ratings by City and Category
- Calculate the average, minimum, and maximum ratings for each category across cities.

### 5. Profit Analysis
- Calculate total profit for each category using a formula:  
  `Total Profit = Unit Price × Quantity × Profit Margin`.

### 6. Common Payment Methods by Branch
- Identify the most common payment method used in each branch.

### 7. Sales Shifts
- Categorize sales into shifts: Morning, Afternoon, and Evening.  
  Find the shift with the highest sales overall and for each branch.

### 8. Revenue Trends
- Compare revenue between two years (2022 and 2023).  
  Calculate the percentage decrease in revenue for branches with declining performance.

---

## Insights
- **Payment Preferences**: The most popular payment methods by transaction count.
- **Branch Analysis**: Insights into top-performing categories and busiest days for resource planning.
- **Profitability**: Categories contributing the most to total profit.
- **Sales Patterns**: High sales shifts and their impact on staffing or inventory.
- **Revenue Trends**: Year-over-year revenue decline ratios for branches, helping identify areas for improvement.

---

## Contribution
Contributions are welcome! If you have suggestions for new queries or insights, feel free to fork this repository, open an issue, or submit a pull request.
