#### Preamble ####
# Purpose: Cleans the raw plane data recorded
# Date: 10 March 2024 
# Contact: hechen.zhang@mail.utoronto.ca

#### Workspace setup ####
library(tidyverse)

#### Clean data ####
# Look at the distribution of these deaths, by year and cause.
alberta_cod <-
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

# look at the top-eight causes in 2022
alberta_cod |>
  filter(
    calendar_year == 2022,
    ranking <= 8
  ) |>
  mutate(total_deaths = format(total_deaths, big.mark = ",")) |>
  kable(
    col.names = c("Year", "Cause", "Ranking", "Deaths", "Years"),
    align = c("l", "r", "r", "r", "r"),
    digits = 0, booktabs = TRUE, linesep = ""
  )

# Look up the five most common causes of death in 2022 of those that have been present every year.
alberta_cod_top_five <-
  alberta_cod |>
  filter(
    calendar_year == 2022
  ) |>
  slice_max(order_by = desc(ranking), n = 5) |>
  pull(cause)
alberta_cod_top_five

alberta_cod <-
  alberta_cod |>
  filter(cause %in% alberta_cod_top_five)

#### Save data ####
write_csv(alberta_cod, "data/analysis_data/analysis_data.csv")
