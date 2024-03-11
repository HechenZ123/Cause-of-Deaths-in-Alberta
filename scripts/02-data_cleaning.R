#### Preamble ####
# Purpose: Cleans the raw plane data recorded
# Date: 10 March 2024 
# Contact: hechen.zhang@mail.utoronto.ca

#### Workspace setup ####
library(tidyverse)
library(janitor)
library(knitr)

#### Clean data ####
# Look at the distribution of these deaths, by year and cause.
clean_data <-
  read_csv(
    "data/raw_data/raw-data-deaths-leading-causes.csv",
    skip = 2,
    col_types = cols(
      `Calendar Year` = col_integer(),
      Cause = col_character(),
      Ranking = col_integer(),
      `Total Deaths` = col_integer()
    )
  ) |>
  clean_names() |>
  add_count(cause) |>
  mutate(cause = str_trunc(cause, 30))

# Drop rows with missing data
clean_data <- na.omit(clean_data)

#### Save data ####
write_csv(clean_data, "data/analysis_data/analysis_data.csv")
