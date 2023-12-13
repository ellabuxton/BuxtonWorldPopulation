usethis::use_testthat()
library(testthat)
test_that('CountryPopulation returns an error for countries not in the data frame', {
  # Test with a non-existent country
  expect_error(CountryPopulation('Arizona'))
  expect_error(CountryPopulation('USA'))

  # Test with an existing country
  expect_true('Italy' %in% WorldPopulation$Country)
  expect_true('France' %in% WorldPopulation$Country)
})
