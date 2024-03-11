#### Preamble ####
# Purpose: A Poison Model and a Negative Binomial Model of Analysis Data
# Date: 11 March 2024
# Contact: hechen.zhang@mail.utoronto.ca

#### Workspace setup ####
library(tidyverse)
library(rstanarm)
library(here)

#### Read data ####
alberta_cod <- read_csv("data/analysis_data/analysis_data.csv")

### Model data ####
set.seed(302)
cause_of_death_alberta_poisson <-
  stan_glm(
    total_deaths ~ cause,
    data = alberta_cod,
    family = poisson(link = "log")
  )

cause_of_death_alberta_neg_binomial <-
  stan_glm(
    total_deaths ~ cause,
    data = alberta_cod,
    family = neg_binomial_2(link = "log")
  )

#### Save model ####
saveRDS(
  cause_of_death_alberta_poisson,
  file = here::here("models/cause_of_death_alberta_poisson.rds"))

saveRDS(
  cause_of_death_alberta_neg_binomial,
  file = here::here("models/cause_of_death_alberta_neg_binomial.rds"))



