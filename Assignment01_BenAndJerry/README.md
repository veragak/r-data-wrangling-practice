# Assignment 01 — Ben & Jerry’s Price & Demographic Analysis

This folder contains a small R exercise focused on price calculations and basic
data summarization using the Ben & Jerry’s retail dataset. The goal is to
practice base R functions such as vector creation, subsetting, aggregate(),
table(), and simple percentage calculations.

All task descriptions have been rewritten for this repository and do not contain
any original course material.

---

## Tasks Covered

### **Task 1 — Compute unified unit prices**
Create a single `unit_price` vector that combines deal and non-deal prices for
every purchase.

### **Task 2 — Compare unit prices across product formulas**
Using `aggregate()`, calculate average unit prices for each formula
(`formula_descr`). Store the result as `formula_prices`.

### **Task 3 — Promotional vs non-promotional price comparison**
Compute:
- `promo_prices`: average prices for purchases under promotion  
- `nopromo_prices`: average prices for purchases without promotion  
Then compute average unit discounts per formula.

### **Task 4 — Purchase distribution by household head gender**
Create a logical column indicating whether the household has a male head.
Use `table()` and `prop.table()` to calculate purchase percentages per flavor
for:
- households with a male head  
- households without a male head  

Percentages are rounded to two decimals.

---

## Files

- `assignment01_analysis.R` — full solution using base R  
- `BenAndJerry.csv` — dataset used (if available)

---

## Requirements
This exercise uses **only base R**, no additional packages required.

