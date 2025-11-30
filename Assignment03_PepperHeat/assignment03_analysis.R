############################################################
# Assignment 03 — Pepper Heat Scale Analysis
# Tasks rewritten for GitHub (no original course text).
############################################################

# Load tidyverse (allowed by assignment)
library(tidyverse)

############################################################
# Task 1 — Convert pepper heat levels to an ordered factor
############################################################

# Random pepper heat vector (given)
pepper_heat <- sample(
  c("mild", "medium", "hot", "extra hot", "extra, extra hot"),
  size = 50, replace = TRUE
)

# Create ordered factor
pepper_heat <- factor(
  pepper_heat,
  levels = c("mild", "medium", "hot", "extra hot", "extra, extra hot"),
  ordered = TRUE
)

# Minimum and maximum heat levels
min(pepper_heat)
max(pepper_heat)

############################################################
# Task 2 — Rename levels and reverse the order
############################################################

# Rename levels
levels(pepper_heat)[levels(pepper_heat) == "extra hot"] <- "fire"
levels(pepper_heat)[levels(pepper_heat) == "extra, extra hot"] <- "hell"

# Reverse order from mild → hell
pepper_heat <- factor(
  pepper_heat,
  levels = rev(c("mild", "medium", "hot", "fire", "hell")),
  ordered = TRUE
)

# New min and max
min(pepper_heat)
max(pepper_heat)

############################################################
# Task 3 — Proportion of peppers with heat ≤ "hot"
############################################################

pepper_proportion <- mean(pepper_heat <= "hot")
pepper_proportion

