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
  mutate(
    value = as.numeric(value),
    year = year(ymd(ref_date)) # Convert ref_date to year
  ) %>%
  drop_na(value) # Drop rows where 'value' is NA


# Ensure this is the correct variable containing cleaned or aggregated data
cleaned_data <- raw_data # Placeholder: replace with actual cleaned/aggregated data variable if different


#### Save cleaned data ####
# Adjust the file path and format as needed
write_csv(aggregated_data, here::here("data/cleaned_data.csv"))

