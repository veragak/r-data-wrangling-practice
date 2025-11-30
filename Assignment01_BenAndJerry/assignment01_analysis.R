############################################################
# Assignment 01 — Ben & Jerry’s Price & Demographic Analysis
# This script solves the exercise using only base R.
# Tasks have been rewritten for GitHub (no original material).
############################################################

# Load dataset (replace with path in your project)
BenAndJerry <- read.csv("BenAndJerry.csv")

############################################################
# Task 1 — Compute unified unit prices
############################################################

unit_price <- (BenAndJerry$price_paid_deal +
               BenAndJerry$price_paid_non_deal) /
               BenAndJerry$quantity

BenAndJerry$unit_price <- unit_price


############################################################
# Task 2 — Compare unit prices across product formulas
############################################################

formula_prices <- aggregate(unit_price ~ formula_descr,
                            FUN = mean,
                            data = BenAndJerry)

print(formula_prices)


############################################################
# Task 3 — Promotional vs non-promotional price comparison
############################################################

# Under promotion
promo_prices <- aggregate(unit_price ~ formula_descr,
                          FUN = mean,
                          data = BenAndJerry[!is.na(BenAndJerry$promotion_type), ])

print(promo_prices)

# Without promotion
nopromo_prices <- aggregate(unit_price ~ formula_descr,
                            FUN = mean,
                            data = BenAndJerry[is.na(BenAndJerry$promotion_type), ])

print(nopromo_prices)

# Average unit discounts
unit_discounts <- nopromo_prices$unit_price - promo_prices$unit_price
names(unit_discounts) <- nopromo_prices$formula_descr

print(unit_discounts)


############################################################
# Task 4 — Purchase distribution by household head gender
############################################################

# TRUE if a male head exists, FALSE otherwise
BenAndJerry$has_male_head <- !is.na(BenAndJerry$male_head_birth)

# Counts of purchases
purchase_counts <- table(BenAndJerry$flavor_descr,
                         BenAndJerry$has_male_head)

# Convert to percentages (columns sum to 100)
gender_pop <- prop.table(purchase_counts, margin = 2) * 100
gender_pop <- round(gender_pop, 2)

print(gender_pop)
