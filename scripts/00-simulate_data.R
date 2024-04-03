#### Preamble ####
# Purpose: Install the dependencies required for this project
# Author: Qin He
# Date: April 1, 2024
# Contact: thisisheqins@gmail.com
# License: MIT
# Pre-requisites: You must also have the R language installed
# GitHub: https://github.com/qinheinfo/Canada_inflation/tree/main


#### Workspace setup ####
library(tibble)
library(readr)
library(here)


#### Function to simulate data ####
simulate_cpi_data <- function(years, size, start_value, growth_rate) {
  set.seed(853) # Ensure reproducibility
  year_sequence <- seq(from = min(years), to = max(years))
  values <- numeric(length(year_sequence))
  
  values[1] <- start_value
  for (i in 2:length(year_sequence)) {
    # Simulate yearly growth based on provided growth rate
    growth <- rnorm(1, mean = growth_rate, sd = growth_rate / 10)
    values[i] <- values[i - 1] * (1 + growth)
  }
  
  data <- tibble(
    REF_DATE = rep(year_sequence, each = size / length(year_sequence)),
    GEO = "Canada",
    DGUID = "2016A000011124",
    `Products and product groups` = "All-items",
    UOM = "2002=100",
    UOM_ID = 17,
    SCALAR_FACTOR = "units",
    SCALAR_ID = 0,
    VECTOR = "v41693271",
    COORDINATE = 2.2,
    VALUE = rep(values, each = size / length(year_sequence)),
    STATUS = NA,
    SYMBOL = NA,
    TERMINATED = NA,
    DECIMALS = 1
  )
  
  return(data)
}


#### Simulate Data for 2019-2023 ####
simulated_cpi_data <- simulate_cpi_data(years = c(2019, 2020, 2021, 2022, 2023), size = 20, start_value = 136, growth_rate = 0.03)


#### Save Simulated Data ####
write_csv(simulated_cpi_data, here::here("inputs/simulated_cpi_data.csv")) # Save to inputs/data
