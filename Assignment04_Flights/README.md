# Assignment 04 — NYC Flights Delay & Duration Analysis

This assignment focuses on working with datetime data, flight scheduling 
information, delay calculations, and tidyverse summarization. The dataset 
contains flight departures from New York City during the first nine months 
of 2013.

All task descriptions have been rewritten for this repository and do not 
contain original course material.

---

## Tasks Covered

### **Task 1 — Convert time columns to datetime objects**
- Convert the first four columns (actual/scheduled departure, actual/scheduled arrival) 
  into datetime objects using `lubridate`.
- Keep only rows where actual arrival time is not missing.

### **Task 2 — Compute scheduled flight duration**
- Add a new column `scheduled_time`, containing the number of minutes 
  between scheduled departure and scheduled arrival.
- Count how many flights have a scheduled time greater than 6 hours.

### **Task 3 — Create a delayed flights indicator**
- Add a logical column `delayed` equal to TRUE if the arrival delay exceeds 
  30 minutes.

### **Task 4 — Proportion of delayed flights per carrier**
- Using `dplyr`, calculate the proportion of delayed flights per airline 
  carrier.

### **Task 5 — Weekly summary of total and delayed flights**
- Determine the weekday of scheduled departure.
- Create a table showing the total number of flights per weekday and the 
  number of delayed flights.
- Weekdays should be labeled and ordered from Monday to Sunday.

---

## 📂 Files

- `assignment04_analysis.R` — full solution using lubridate + tidyverse  
- The dataset used in this project cannot be shared due to course policies.

---

## Required Packages

This exercise uses:

```r
library(tidyverse)
library(lubridate)
