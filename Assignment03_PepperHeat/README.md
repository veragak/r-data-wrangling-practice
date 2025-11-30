# Assignment 03 — Pepper Heat Scale Analysis

This folder contains a short exercise involving ordered factors and simple 
categorical manipulation in R. The goal is to practice factor ordering, level 
renaming, reversing factor sequences, and computing proportions based on 
ordered categories.

All task descriptions have been rewritten for this repository and do not contain 
original course material.

---

## Tasks Covered

### **Task 1 — Create an ordered pepper heat factor**
- Convert a character vector of pepper heat levels into an ordered factor.
- Assign the levels in increasing heat order from “mild” to “extra, extra hot”.
- Print the minimum and maximum factor values.

### **Task 2 — Rename levels and reverse the order**
- Rename the highest two heat levels to “fire” and “hell”.
- Reverse the factor order so that heat increases from “mild” to “hell”.
- Print the new minimum and maximum levels.

### **Task 3 — Proportion of peppers that are “hot” or below**
- Compute the proportion of peppers in the vector with a heat level up to “hot”.
- Use one concise line of code.

---

## Files
- `assignment03_analysis.R` — full solution with tidyverse
- (no dataset required for this exercise)

---

## Required Packages
This exercise uses **tidyverse** for convenience, though only base R is needed.

```r
library(tidyverse)
