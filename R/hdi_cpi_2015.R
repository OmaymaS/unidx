#' hdi_cpi_2015 Data
#'
#' A dataframe combining Human Development Index by UNDP and Corruption Perception Index from Transparency International for 121 countries.
#'
#' @format  The main dataframe `hdi_cpi_2015` has 121 rows and 10 variables:
#' \describe{
#' \item{country}{factor with 121 levels}
#' \item{country_code}{factor}
#' \item{region}{factor with 6 levels}
#' \item{continent}{factor with 5 levels}
#' \item{population}{country population in 2015}
#' \item{corruption_perception_index}{lower values reflect higher perceived corruption}
#' \item{cpi_rank}{country rank according to corruption perception index}
#' \item{human_development_index}{lower values reflect lowerdevelopment}
#' \item{hdi_rank}{country rank according to human development index}
#' \item{year}{year 2015}
#' }
#' @md
#' @source
#' - [UNDP](http://hdr.undp.org/en/data)
#' - [Transparency.org](https://www.transparency.org/cpi2015#downloads)
#' - [Gapminder population data](https://docs.google.com/spreadsheet/pub?key=phAwcNAVuyj0XOoBL_n5tAQ&output=xlsx)
#' @md
#'
"hdi_cpi_2015"
