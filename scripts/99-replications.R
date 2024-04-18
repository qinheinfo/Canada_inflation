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


```{r}
#| messages: false
#| echo: false
#| warning: false
#| label: fig-2
#| fig-cap: "Cost of Bacon Rate vs. Inflation Rate, data (since 2018)"
#| fig-align: center
#| fig-width: 10
#| fig-height: 3
#### Create graphs plotting mandated and actual response times ####
bacon_table_display <- bacon_inflation_data |>
  # Order the columns 
  select(year, bacon, percent_change, inflation_rate) |> 
  
  # Change months to fiscal quarters
  mutate(bacon =  paste("\\$", bacon, sep = "")) |>
  mutate(percent_change =  paste(percent_change, "\\%", sep = "")) |>
  mutate(inflation_rate =  paste(inflation_rate, "\\%", sep = "")) |>
  
  # Rename the columns
  rename(
    "Year" = "year", 
    "Bacon Cost" = "bacon", 
    "Inflation Rate" = "inflation_rate", 
    "Bacon Cost Rate" = "percent_change"
  )

bacon_table_display |>
  knitr::kable(align = "l", booktabs = TRUE, escape = FALSE, linesep = "" )|>
  kable_styling(font_size = 10, latex_options = "hold_position", full_width = TRUE)
```
