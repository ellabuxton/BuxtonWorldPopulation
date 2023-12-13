library(tidyverse)
library(rvest)
library(readxl)

# Read in the data
url <- 'https://en.wikipedia.org/wiki/FIFA_World_Cup'
page <- read_html(url)
data <- page %>%
  html_nodes('table') %>%
  .[[4]] %>%
  html_table(header=FALSE, fill=TRUE)

# Do some cleaning/verification
World_Cup <- data %>%
  select(X1, X2, X5, X4, X6) %>%
  magrittr::set_colnames(c('Year', 'Hosts', 'Matches', 'Totalattendance', 'Averageattendance')) %>%
  slice(-1 * 1:2) %>%
  slice(-1 * 23:26) %>%
  mutate_at( vars(matches('attendance')), str_remove_all, ',') %>%
  mutate_at( vars( matches('attendance')), as.numeric) %>%
  mutate(WorldCup = paste(Hosts, Year, sep='')) %>%
  select(-Hosts, -Year)

# Save the data frame to the data/ directory as MaxTemp.rda
usethis::use_data(World_Cup, overwrite = TRUE)
