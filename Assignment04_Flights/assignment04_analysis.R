############################################################
# Assignment 04 — NYC Flights Delay & Duration Analysis
# Tasks rewritten for GitHub.
############################################################

# Load required packages
library(tidyverse)
library(lubridate)

############################################################
# Load data
############################################################

# In GitHub, dataset stored under ../data/
load("../data/flights.RData")

############################################################
# Task 1 — Convert the first four columns to datetime objects
############################################################

flights[, 1:4] <- lapply(flights[, 1:4], ymd_hm)

# Keep only rows with non-missing arrival time
flights <- flights[!is.na(flights$arr_time), ]

############################################################
# Task 2 — Compute scheduled flight duration (in minutes)
############################################################

flights <- flights %>%
  mutate(scheduled_time = as.numeric(
    difftime(sched_arr_time, sched_dep_time, units = "mins")
  ))

# Count flights scheduled > 6 hours (360 minutes)
sum(flights$scheduled_time > 360)

############################################################
# Task 3 — Identify delayed flights (>30 min arrival delay)
############################################################

flights <- flights %>%
  mutate(delayed = as.numeric(
    difftime(arr_time, sched_arr_time, units = "mins")
  ) > 30)

############################################################
# Task 4 — Proportion of delayed flights per carrier
############################################################

carrier_delay <- flights %>%
  group_by(carrier) %>%
  summarise(proportion_delayed = mean(delayed, na.rm = TRUE))

print(carrier_delay)

############################################################
# Task 5 — Weekday summary for total and delayed flights
############################################################

flights_summary <- flights %>%
  mutate(weekday = wday(sched_dep_time, label = TRUE, abbr = FALSE)) %>% 
  group_by(weekday) %>%
  summarise(
    total_flights = n(),
    delayed_flights = sum(delayed, na.rm = TRUE)
  ) %>%
  arrange(match(
    weekday, 
    c("Monday", "Tuesday", "Wednesday", "Thursday", "Friday", "Saturday", "Sunday")
  ))

print(flights_summary)
