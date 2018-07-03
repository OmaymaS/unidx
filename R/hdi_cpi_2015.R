#' hdi_cpi_2015
#'
#' A dataframe combining Human Development Index by UNDP and Corruption Perception Index from Transparency International for 121 countries.
#'
#' @format  The main dataframe `hdi_cpi_2015` has 121 rows and 10 variables:

#' - **country**: factor with 121 levels
#' - **country_code**: factor
#' - **region**: factor with 6 levels
#' - **continent**: factor with 5 levels
#' - **population**: country population in 2015
#' - **corruption_perception_index**:  lower values reflect higher perceived corruption
#' - **cpi_rank**:  country rank according to corruption perception index
#' - **human_development_index**:  lower values reflect lowerdevelopment
#' - **hdi_rank**:  country rank according to human development index
#' - **year**:  year 2015
#'
#' @source
#' - [UNDP](http://hdr.undp.org/en/data)
#' - [Transparency.org](https://www.transparency.org/cpi2015#downloads)
#' - [Gapminder population data](https://docs.google.com/spreadsheet/pub?key=phAwcNAVuyj0XOoBL_n5tAQ&output=xlsx)
#' @md
#'
"hdi_cpi_2015"
