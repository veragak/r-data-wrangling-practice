############################################################
# Assignment 02 — Light Beer Market & Price Analysis
# Uses base R (aggregate) and tidyverse/dplyr.
# Tasks have been rewritten for GitHub.
############################################################

# Load packages
library(tidyverse)   # includes dplyr

############################################################
# Load data
############################################################

# In the GitHub repo, the dataset is stored in ../data/
LightBeer <- read.csv("../data/LightBeer.csv")

############################################################
# Task 1 — Average liter prices by brand and market (base R)
############################################################

# 1 liter ≈ 33.814 fl oz
LightBeer$liter.price <- LightBeer$price_floz * 33.814

market_prices_base <- aggregate(
  liter.price ~ beer_brand + market,
  subset = (container_descr == "NON REFILLABLE BOTTLE"),
  FUN = mean,
  data = LightBeer
)

# Round liter prices
market_prices_base$liter.price <- round(market_prices_base$liter.price, 2)

# Print first 10 rows
head(market_prices_base, n = 10)

############################################################
# Task 2 — Average liter prices with tidyverse and missing combos
############################################################

market_prices <- LightBeer %>%
  # Keep only NON REFILLABLE BOTTLE
  filter(container_descr == "NON REFILLABLE BOTTLE") %>%
  # Price per liter
  mutate(liter.price = price_floz * 33.814) %>%
  # Group by brand and market
  group_by(beer_brand, market) %>%
  # Compute mean price
  summarize(
    mean_price = mean(liter.price, na.rm = TRUE),
    .groups = "drop"
  ) %>%
  # Include all combinations of brand and market
  tidyr::complete(beer_brand, market, fill = list(mean_price = NaN)) %>%
  # Round numeric values
  mutate(across(where(is.numeric), ~ round(.x, 2)))

# Print first 10 combinations with no purchases (NaN)
market_prices %>%
  filter(is.nan(mean_price)) %>%
  head(10)

############################################################
# Task 3 — Rural vs urban price comparison
############################################################

# Prices in Philadelphia
philly_prices <- market_prices %>%
  filter(market == "PHILADELPHIA") %>%
  select(beer_brand, mean_price) %>%
  rename(Philadelphia = mean_price)

# Prices in Rural Pennsylvania
rural_prices <- market_prices %>%
  filter(market == "RURAL PENNSYLVANIA") %>%
  select(beer_brand, mean_price) %>%
  rename(`Rural Pennsylvania` = mean_price)

# Combine into comparison table
price_comparison <- philly_prices %>%
  full_join(rural_prices, by = "beer_brand") %>%
  rename(`Beer brand` = beer_brand)

price_comparison
