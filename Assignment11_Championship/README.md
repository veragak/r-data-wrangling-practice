# World Series Championship Analysis  
### **Assignment 11 — EB04 Group 2**

**Authors**  
- Zhanica Arrindell (596427)  
- Vera Gak Anagrova (772713)  
- Aleksandra Tatko (648925)  
- Ly Le (644801)  

---

## Overview  
This project reproduces **Assignment 11** of the EB04 course and focuses on scraping, cleaning, and analyzing historical MLB World Series results using **R**, **rvest**, and **ggplot2**.

The analysis consists of:  
1. Scraping the *World Series Winners & Losers* table from Wikipedia.  
2. Cleaning the dataset (handling missing years, removing parentheses, wildcard tags, etc.).  
3. Displaying the **last 20 cleaned entries**.  
4. Visualizing **World Series wins and losses** (excluding wildcard-winning teams).  
5. Interpreting patterns in team performance.

The report is submitted as:  
- `Assignment11_analysis.Rmd` — source code & analysis  
- `Assignment11_analysis.pdf` — compiled PDF

---

## Task 1 — Web Scraping  
Using `rvest`, we scrape the static table *Winning teams and losing teams* from the Wikipedia page:

`https://en.wikipedia.org/wiki/List_of_World_Series_champions`

```r
wiki <- "https://en.wikipedia.org/wiki/"
url <- "List_of_World_Series_champions"
champions <- read_html(paste0(wiki, url))

champions.table <- html_table(champions)
tab1 <- champions.table[[2]]
```

## Task 2 — Data Cleaning
Data cleaning includes:
- Replacing rows with “No World Series held” with NA
- Removing parentheses, numbers, and wildcard markers [W]
- Extracting team names using strsplit()
- Trimming whitespace
- Renaming columns

```r
tab1[tab1$Year == "No World Series held", ] <- NA

tab1$`Winning team` <- gsub("\\(.*?\\)", "", tab1$`Winning team`)
tab1$`Winning team` <- gsub("\\[W\\]", "", tab1$`Winning team`)
tab1$`Losing team`  <- gsub("\\(.*?\\)", "", tab1$`Losing team`)

tab1$`Winning team` <- trimws(tab1$`Winning team`)
tab1$`Losing team`  <- trimws(tab1$`Losing team`)
```

A formatted table using `kable()` displays the last 20 rows of cleaned data in the report.

### Observations from the Last 20 Championships (2005–2024)
- 16 different franchises won the World Series.
- Only the San Francisco Giants (3) and Boston Red Sox (3) won multiple titles.
- 8 wildcard teams won the championship (~40%).
- Bruce Bochy appears as a top-performing manager (Giants + Rangers).
- Most series end 4–1 or 4–2, with only a few 7-game series.
- Strong competitive balance from 2015 onward with different winners most years.

## Task 3 — Wins & Losses Visualization

Wildcard winners ([W]) are excluded.
```r
#Wins per Team
wins <- tab1 %>%
  filter(!grepl("\\[W\\]", WinningTeam)) %>%
  group_by(WinningTeam) %>%
  summarise(Wins = n())

#Losses per Team
losses <- tab1 %>%
  filter(!grepl("\\[W\\]", LosingTeam)) %>%
  group_by(LosingTeam) %>%
  summarise(Losses = n())
```

Both barplots use a shared y-axis range to allow fair comparison.

---

## Interpretation

New York Yankees dominate with 27 wins and 13 losses, the most in MLB history.
Teams like the Cardinals, Dodgers, and Red Sox appear in both charts due to frequent finals participation.
Teams with fewer losses tend to appear less often or maintain strong efficiency.
Repeated finalists accumulate both wins and losses—participation drives volume.

---

## Repository Structure

`Assignment11_Championship`
  - Assignment11.Rmd          # Full analysis
  - Assignment11b.pdf         # Compiled PDF
  - README.md                 # Project documentation


## Required R Packages
library(rvest)
library(stringr)
library(ggplot2)
library(knitr)
library(dplyr)
