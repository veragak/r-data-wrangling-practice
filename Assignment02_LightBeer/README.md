# Assignment 02 — Light Beer Market & Price Analysis

This folder contains a small R exercise focused on computing liter prices and 
comparing them across beer brands and markets. The goal is to practice both 
base R (`aggregate`) and tidyverse (`dplyr`) for grouped summaries and working
with incomplete brand–market combinations.

All task descriptions have been rewritten for this repository and do not contain
original course material.

---

## 📝 Tasks Covered

### **Task 1 — Average liter prices by brand and market (base R)**

- Compute price per liter for each purchase.
- Use `aggregate()` to calculate the average liter price for combinations of 
  `beer_brand` and `market`, considering only `NON REFILLABLE BOTTLE`.
- Round prices to 2 decimals and print the first 10 rows.

---

### **Task 2 — Average liter prices with tidyverse and missing combinations**

- Filter `LightBeer` to keep only `NON REFILLABLE BOTTLE`.
- Create a `liter.price` variable from `price_floz`.
- Group by brand and market, and compute the average liter price.
- Use `complete()` to include brand–market combinations with no observations, 
  filling missing values with `NaN`.
- Print the first 10 rows of the combinations with `NaN` prices.

---

### **Task 3 — Rural vs urban price comparison**

- Extract mean liter prices per brand for `PHILADELPHIA`.
- Extract mean liter prices per brand for `RURAL PENNSYLVANIA`.
- Join both into one comparison table with three columns:
  `Beer brand`, `Philadelphia`, `Rural Pennsylvania`.

---

## 📂 Files

- `assignment02_analysis.R` — full solution using base R + tidyverse
- (optional) `../data/LightBeer.csv` — dataset used for the exercise

---

## 📦 Required Packages

This exercise uses:

- **tidyverse / dplyr** for data manipulation
- base R functions (e.g. `aggregate()`)

Install (if needed):

```r
install.packages(c("tidyverse"))
