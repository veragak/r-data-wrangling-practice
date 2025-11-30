# Assignment 06 — Bike Rentals in Washington, D.C.

This project analyzes the Washington bike-sharing dataset using RMarkdown.  
The analysis includes visualizations of rental distributions, weekly usage patterns, 
weekday user behavior, and the relationship between temperature and bike demand.

All task descriptions below are fully rewritten and do not include original course material.

---

## Overview of the Analysis

The dataset contains daily bike rental information, user types, weather categories, 
and normalized temperature values.

The analysis covers four main components:

---

### **A. Distribution of Bike Rentals by Weather Condition**

- Converts weather codes into meaningful labels  
- Uses **density plots** to visualize distributions across three weather types  
- Densities are transparent (alpha) so all can be compared clearly  
- Fully customized title, axes, and colors  

*Figure: Overlapping density curves showing total rentals across weather conditions.*

---

### **B. Weekly Bike Usage in 2012**

- Converts date column to proper `Date` format  
- Filters all observations from **2012**  
- Aggregates weekly totals for:
  - overall rentals (`cnt`)
  - registered users
  - casual users  
- Creates a **multi-line plot** to compare three time series across weeks  

*Figure: Weekly line plot showing total, registered, and casual users.*

---

### **C. Casual User Share Across Weekdays (2012)**

- Computes the proportion of rentals from casual users  
- Creates a **boxplot per weekday**, sorted Monday → Sunday  
- Adds a **red diamond marker** representing the **mean** for each weekday  
- Includes a legend explaining the mean indicator  

*Figure: Boxplot showing casual rental proportions per weekday.*

---

### **D. Temperature vs Total Rentals (Full Time Range)**

- Denormalizes temperature values based on data documentation (temp × 41°C)  
- Creates a **base R scatterplot** of rentals vs temperature  
- Differentiates holidays and non-holidays with different shapes/colors  
- Includes a clean legend and axis labels  

*Figure: Scatterplot showing rental volume as a function of temperature.*

---

## Files in This Folder
- `Assignment6.Rmd`: Full reproducible RMarkdown solution |
- `Assignment6b.pdf`: Rendered PDF version of the assignment |
- `Bikes_Washington.csv`: Dataset used throughout the analysis found in data/ folder outside
- `README.md`: Documentation for the project 

---

## How to Run This Project

1. Open the `.Rmd` file in **RStudio**.  
2. Ensure that **Bikes_Washington.csv** is placed in the same folder.  
3. Install required packages if missing:  
```r
install.packages(c("tidyverse", "ggplot2", "lubridate", "readr"))
```
4. Knit the document to PDF.
A LaTeX distribution (MacTeX / TeXLive / MikTeX) is required.

---

## Packages Used
```r
library(tidyverse)
library(ggplot2)
library(lubridate)
library(readr)
library(gridExtra)
```
---

## Authors
- Vera Gak Anagrova
- Zhanica Arrindell
- Aleksandra Tatko
- Ly Le

