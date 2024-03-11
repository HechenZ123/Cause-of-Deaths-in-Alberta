#### Preamble ####
# Purpose: Tests Simulated Data and Analysis Data
# Date: 11 March 2024
# Contact: hechen.zhang@mail.utoronto.ca


#### Workspace setup ####
library(tidyverse)


#### Test data ####
#### Test Simulated Data ####
# Load the simulated dataset
simulated_data <- read.csv("data/raw_data/simulated_data.csv")

# Check if 'cause' is character
is.character(simulated_data$cause)

# Check if 'year' is numeric
is.numeric(simulated_data$year)

# Check if 'deaths' is numeric
is.numeric(simulated_data$deaths)

# Check if any numerical data is mistakenly entered as character, or any character data is mistakenly entered as number.
!is.numeric(simulated_data$cause)
!is.character(simulated_data$year)
!is.character(simulated_data$deaths)

# Check if categorical data variables contain expected unique values only
all(simulated_data$cause %in% c('Heart', 'Stroke', 'Diabetes'))


#### Test Real Data ####
# Load analysis_data.csv
analysis_data <- read.csv("data/analysis_data/analysis_data.csv")

library(readr)

# Test data types
is.integer(analysis_data$calendar_year)
is.character(analysis_data$cause)
is.integer(analysis_data$ranking)
is.integer(analysis_data$total_deaths)
is.integer(analysis_data$n)

# Verify calendar_year range
analysis_data$calendar_year
all(analysis_data$calendar_year >= 2001 & analysis_data$calendar_year <= 2022)

# Ensure ranking is positive
all(analysis_data$ranking > 0 & analysis_data$ranking <= 100)

# Ensure total_deaths is non-negative
all(analysis_data$total_deaths >= 0)

# Check 'n' for specific range 
all(analysis_data$n >= 1 & analysis_data$n <= 1000)
