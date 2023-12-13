library(tidyverse)
library(rvest)
library(readxl)

# Read in the data
data2 <- read_excel('World_Population.xls', sheet='ESTIMATES', skip=16)

# Do some cleaning/verification
WorldPopulation <- data2 %>%
  filter(Type == 'Country/Area') %>%
  select(-Index, -Variant, -Notes, -'Country code', -Type, -'Parent code') %>%
  rename('Country'=1) %>%
  pivot_longer('1950':'2020', names_to  = 'Year', values_to = 'Population') %>%
  mutate_at( vars( matches('Population')), as.numeric)

# Save the data frame to the data/ directory as MaxTemp.rda
usethis::use_data(WorldPopulation, overwrite = TRUE)



