#' A function that takes a country name and generates a graph of any country's population over time.
#' @param x A country name within the data frame
#' @return  A graph of \code{countryname} population over time
#' @examples
#' CountryPopulation('China')
#' CountryPopulation('India')
#' @export
CountryPopulation <- function(countryname){
  if(!countryname %in% WorldPopulation$Country){stop('Error Message')}
  else{
    selectcountry <- WorldPopulation %>%
      filter(Country == countryname) # select country rows based on input

    ggplot(selectcountry, aes(x=Year, y=Population, group=Country)) +
      geom_line() +
      labs(title = paste(countryname,'Population Over Time'),
           x = 'Year',
           y = 'Population') +
      theme_bw()
  }
}
