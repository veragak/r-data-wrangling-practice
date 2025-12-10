# Assignment 05 — Cereal Nutrition & Rating Analysis

This project explores the relationship between cereal nutritional characteristics 
and consumer ratings. The analysis was completed in RMarkdown and includes 
factor creation, customized boxplots, scatterplot comparisons, and histogram-based 
manufacturer comparisons. All task descriptions have been rewritten for this 
repository and contain no original course material.

---

## Overview

The dataset used in this project cannot be shared due to course policies.


### **A. Calorie-based rating comparison**
- Creation of an ordered factor `cal_level` with five calorie categories  
- Boxplot of cereal ratings by calorie level  
- Highlighting of the highest-rated calorie group with a custom color  

### **B. Rating vs Sugar & Rating vs Calories**
- Two side-by-side scatterplots (sugar vs rating and calories vs rating)  
- Highlighting cereals from the highest-rated manufacturer  
- Fully customized visuals with clear labels and colors  

### **C. Comparison of two main manufacturers**
- Identification of the two manufacturers with the most cereals  
- Two histograms plotted side-by-side with identical axis scales  
- Red vertical lines showing each manufacturer’s mean rating  
- Consistent styling across both plots  

---

## 📂 Files Included

- **Assignment05_analysis.Rmd** – Full reproducible analysis & plots  
- **Assignment05_analysis.pdf** – Compiled PDF output  
- **Cereals.csv** – Go to data outside the assignment
- **README.md** – Project documentation  

---

## Packages Used

The following packages are required to knit the RMarkdown file:

```r
library(tidyverse)
library(gridExtra)
library(readr)
```
---

## ▶️ How to Run

To reproduce the analysis:

1. Open the `.Rmd` file in **RStudio**.
2. Ensure that **Cereals.csv** is placed in the same folder as the RMarkdown file.
3. Install the required packages (if needed):
   ```r
   install.packages(c("tidyverse", "gridExtra", "readr"))```
4. Click Knit → Knit to PDF in **RStudio**.

Note:
This document uses xelatex as the LaTeX engine, which requires a complete LaTeX distribution such as MacTeX, MikTeX, or TeXLive to be installed on your machine.

---

## Authors
- Vera Gak Anagrova
- Zhanica Arrindell
- Aleksandra Tatko
- Ly Le
