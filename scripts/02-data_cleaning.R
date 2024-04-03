#### Preamble ####
# Purpose: Install the dependencies required for this project
# Author: Qin He
# Date: April 1, 2024
# Contact: thisisheqins@gmail.com
# License: MIT
# Pre-requisites: You must also have the R language installed
# GitHub: https://github.com/qinheinfo/Canada_inflation/tree/main


#### Workspace set-up ####
library(tidyverse)
library(dplyr)
library(here)
library(readr)
library(janitor)
library(arrow)
library(lubridate)

#### Import and filter the raw data ####
raw_data <- read_csv(here::here("data/raw_data/Raw data.csv"), show_col_types = FALSE) %>%
  clean_names() %>%
  select(ref_date, products_and_product_groups, value) %>%
  # Assuming 'All-items' is a category, and adding placeholders for specific products
  filter(products_and_product_groups %in% c("All-items", "PLACEHOLDER_FOR_SPECIFIC_PRODUCTS")) %>%
  mutate(
    value = as.numeric(value),
    year = as.integer(ref_date)
  ) %>%
  drop_na(value) # Drop rows where 'value' is NA

# Example placeholder for specific products could be replaced with actual product names like "Milk", "Bread", etc.

#### Optional: Aggregate data ####
# If your data has multiple entries per product group per year, you may want to aggregate it.
# This step averages the 'value' by 'year' and 'products_and_product_groups', adjust as necessary.
aggregated_data <- raw_data %>%
  group_by(year, products_and_product_groups) %>%
  summarise(value = mean(value, na.rm = TRUE), .groups = 'drop')

#### Save cleaned data ####
# Adjust the file path and format as needed
write_csv(aggregated_data, here::here("data/cleaned_data.csv"))
# For Parquet format
write_parquet(aggregated_data, here::here("data/cleaned_data.parquet"))

