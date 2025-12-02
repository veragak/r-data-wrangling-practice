# Assignment 9 – Ben & Jerry’s Analysis Using `data.table`

This assignment analyzes the Ben & Jerry’s purchase dataset using **base R** and **data.table**, following the required tasks A–E.

The goal is to compute summary statistics, price differences, and purchase frequencies using only data.table syntax.

---

##  Repository Structure
- `Assignment09_BenAndJerry`
    - `Assignment09_analysis.R` # Main R script with all solutions
    -  `README.md` # Project documentation
    - `../data/BenAndJerry.RData` — dataset used (stored in a common data folder)

---

## Assignment Overview

The dataset `BenAndJerry.RData` contains purchase-level information for Ben & Jerry’s ice cream.  
The tasks involve computing **unit prices**, **group summaries**, and **purchase frequencies**, using only **data.table**.

---

## Tasks Completed

### **A. Add a `unit.price` column**
Unit price computed as:
(price_paid_deal + price_paid_non_deal - coupon_value) / quantity

Added using pure *data.table* syntax.

---

### **B. Compare overall average unit price vs households in 25–75% spending range**

- Average unit price for all purchases  
- Average for purchases where `total_spent` is between the 25th and 75th quantile  
- Compute the difference between the values  
- Both computed strictly with data.table

---

### **C. Average unit price per flavor (data.table only)**

- Compute mean unit price by `flavor_descr`
- Print only flavors containing **BUTTER** or **FUDGE**
- Output columns are properly labelled

---

### **D. Average discount for promotions (data.table)**

Steps:

1. Compute average unit price by `flavor_descr` and `promotion_type`
2. Separate *promoted* vs *non-promoted*
3. Merge by flavor
4. Compute difference: non_promo - promo
5. Take the mean difference across flavors  
→ **Average unit price discount when an item is on promotion**

---

### **E. Purchase frequency by flavor**

- Count purchases per flavor  
- Compute the percentage relative to total purchases  
- Percentages sum to **100**  
- Display **top 10** most purchased flavors  
- Uses only data.table syntax

---

## How to Run

1. Open `Assignment9.R` in RStudio.
2. Ensure `BenAndJerry.RData` is available in the same folder.
3. Run the script top to bottom — no extra packages needed besides:

```r
library(data.table)
```

---

## Required Packages
install.packages("data.table")
library(data.table)

---

## Author

Vera Gak Anagrova
Erasmus School of Economics
MSc Data Science & Marketing Analytics
