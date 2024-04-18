library(readr)
library(dplyr)
library(knitr)
library(kableExtra)

# Read the dataset
data <- read.csv(here::here("data/cleaned_data.csv"))

# Reshape data to wide format
wide_data <- data %>% 
  filter(products_and_product_groups %in% c('Food', 'All-items')) %>%
  spread(key = products_and_product_groups, value = value) %>%
  rename(Year = ref_date)

# Assuming that the 'value' columns are already in the correct format and do not need additional formatting
# If formatting is needed, include the appropriate mutate() calls here

# Create the table
wide_data_display <- wide_data %>%
  select(Year, `Food`, `All-items`) %>% 
  rename(`Food Value` = Food, `All-items Value` = `All-items`)

# Render the table using knitr::kable and kableExtra::kable_styling
wide_data_display %>%
  kable()