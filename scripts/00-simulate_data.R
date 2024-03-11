#### Preamble ####
# Purpose: Simulates a dataset of cause of death
# Author: Hechen Zhang
# Date: 10 March 2024
# Contact: hechen.zhang@mail.utoronto.ca


#### Workspace setup ####
library(tidyverse)

#### Simulate data ####
# set seed for reproducibility
set.seed(302)
# Simulate a dataset of cause of death distributed following the negative binomial distribution.
alberta_death_simulation <-
  tibble(
    cause = rep(x = c("Heart", "Stroke", "Diabetes"), times = 10),
    year = rep(x = 2016:2018, times = 10),
    deaths = rnbinom(n = 30, size = 20, prob = 0.1)
  )

alberta_death_simulation
summary(alberta_death_simulation)

# Record this simulation
write_csv(alberta_death_simulation, "data/raw_data/simulated_data.csv") 

