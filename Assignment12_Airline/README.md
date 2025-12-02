# ✈️ Airline Quality Analysis  
### **Assignment 12 — EB04 Group 2**

**Authors**  
- Zhanica Arrindell (596427)  
- Vera Gak Anagrova (772713)  
- Aleksandra Tatko (648925)  
- Ly Le (644801)  

---

## Overview  

This project reproduces **Assignment 12** of the EB04 course and focuses on scraping and analyzing airline quality ratings for three major (Dutch-related) airline operators from **AirlineQuality.com**:

- KLM Royal Dutch Airlines  
- Air France  
- Transavia  

Using **R** and the **rvest** package, we:

1. Scrape the **overall rating** and **number of reviews** for each airline.  
2. Scrape the **average category ratings** (seat comfort, inflight entertainment, cabin staff, food & beverages, and value for money).  
3. Compile the results into clean data frames.  
4. Visualize the service category ratings in a **grouped barplot**.

The report is delivered as:

- `Assignment12_analysis.Rmd` — R Markdown report (code + narrative)  
- `Assignment12_analysis.pdf` — compiled PDF (via XeLaTeX / MiKTeX / MacTeX / TeXLive)  

---

## Task 1 – Scraping Overall Rating & Number of Reviews  

We define a function `scrape_ratings()` that:

- Reads the HTML of each airline’s review page.  
- Selects the relevant elements using the CSS selectors:  
  - `.customer-rating-total`  
  - `.review-count`  
- Extracts numeric values (using regular expressions) for:  
  - **Total number of reviews**  
  - **Overall rating** (formatted as a decimal, e.g., 5.10)

Example structure of the function:

```r
scrape_ratings <- function(url) {
  page <- read_html(url)
  
  text <- page %>%
    html_nodes(".customer-rating-total, .review-count") %>%
    html_text()
  
  nums <- regmatches(text, gregexpr("[0-9]+", text))
  
  reviews <- as.numeric(nums[[1]][1])
  rating  <- as.numeric(paste(nums[[2]][1], nums[[2]][2], sep = "."))
  
  c(reviews, rating)
}
```
We then apply this function to the three target URLs and collect the results in a data frame:
```r
urls <- c(
  "https://www.airlinequality.com/airline-reviews/klm-royal-dutch-airlines/",
  "https://www.airlinequality.com/airline-reviews/air-france/",
  "https://www.airlinequality.com/airline-reviews/transavia/"
)

results <- t(sapply(urls, scrape_ratings))
colnames(results) <- c("Number of reviews", "Rating")
rownames(results) <- c("KLM", "Air France", "Transavia")

airline_ratings <- as.data.frame(results)
```

### Interpretation (Task 1)

The table is displayed using `kable()` with an appropriate caption.

- **KLM** typically has the **largest number of reviews**, indicating a broad and active customer base.  
- **KLM and Air France** tend to have similar overall ratings around the mid-range (approx. 5/10).  
- **Transavia** usually scores slightly lower overall, consistent with its low-cost carrier positioning.  
- Overall, the ratings suggest **moderate satisfaction**, with room for improvement across all three carriers.

---

## Task 2 – Scraping Average Category Ratings

We extract average ratings for the following service categories:

- **Food & Beverages**  
- **Inflight Entertainment**  
- **Seat Comfort**  
- **Staff Service**  
- **Value for Money**

These values are located in HTML elements using the CSS selector: .stars .fill

---


We implement a function `scrape_avg_ratings()` that:

1. Reads the page and extracts all numeric star values.  
2. Identifies the repeating **1–5 pattern**, which represents the rating scale.  
3. Keeps only the values before the first appearance of that pattern.  
4. Uses peaks in the sequence to detect **average category ratings**.  
5. Returns a tidy data frame containing the five extracted averages.

### Function Example

```r
scrape_avg_ratings <- function(url, airline) {
  html <- read_html(url)
  
  stars_raw <- html %>%
    html_nodes(".stars .fill") %>%
    html_text(trim = TRUE)
  
  stars_num <- as.numeric(stars_raw)
  
  pattern_pos <- which(
    sapply(1:(length(stars_num) - 4), function(i)
      all(stars_num[i:(i + 4)] == 1:5))
  )[1]
  
  relevant <- stars_num[1:(pattern_pos - 1)]
  
  peaks <- c(relevant[-1] == 1, TRUE)
  averages <- relevant[peaks][1:5]
  
  data.frame(
    Airline = airline,
    Food_Beverages = averages[1],
    Inflight_Entertainment = averages[2],
    Seat_Comfort = averages[3],
    Staff_Service = averages[4],
    Value_for_Money = averages[5]
  )
}
```

We apply this function to each airline and combine the results:

```r
airlines_info <- list(
  "KLM Royal Dutch Airlines" = "https://www.airlinequality.com/airline-reviews/klm-royal-dutch-airlines/",
  "Air France"               = "https://www.airlinequality.com/airline-reviews/air-france/",
  "Transavia"                = "https://www.airlinequality.com/airline-reviews/transavia/"
)

average_ratings <- bind_rows(
  lapply(names(airlines_info), function(name)
    scrape_avg_ratings(airlines_info[[name]], name))
)
```
The resulting average_ratings data frame is displayed using 'kable()'

---

## Task 3 – Grouped Barplot of Average Ratings
- To visualize the differences between the airline service categories, we:
- Reshape average_ratings into long format using pivot_longer().
- Create a grouped barplot, where each airline has five bars (one per category).
- Use colors to distinguish the categories.

Example Plotting Code

```r
ratings_long <- average_ratings %>%
  pivot_longer(
    cols = c(Food_Beverages, Inflight_Entertainment, Seat_Comfort,
             Staff_Service, Value_for_Money),
    names_to = "Category",
    values_to = "Rating"
  )

ggplot(ratings_long, aes(x = Airline, y = Rating, fill = Category)) +
  geom_bar(stat = "identity", position = "dodge") +
  scale_fill_brewer(palette = "Set2") +
  labs(
    title = "Average Ratings by Service Category and Airline",
    x = NULL,
    y = "Average Rating (out of 5)",
    fill = "Category"
  ) +
  theme_minimal(base_size = 12) +
  theme(
    legend.position = "bottom",
    plot.title = element_text(face = "bold", hjust = 0.5),
    axis.text.x = element_text(angle = 10, vjust = 1, hjust = 1)
  )

```
# Interpretation (Task 3)

- Seat Comfort and Staff Service consistently score the highest across all airlines.
- Inflight Entertainment and Value for Money tend to be the lowest-rated categories.
- KLM and Air France display similar rating patterns, aligning with their positions as full-service legacy carriers.
- Transavia shows lower ratings in food and entertainment categories, consistent with being a budget airline.

---

# Repository Structure
A suggested folder structure for this assignment:

`Assignment12_Airline`
- Assignment12_analysis.Rmd          # Main R Markdown file
- Assignment12_analysis.pdf         # Compiled PDF report
- README.md                 # Project documentation

---

## Required R Packages

This analysis uses the following R packages:

library(rvest)
library(dplyr)
library(knitr)
library(ggplot2)
library(tidyr)
