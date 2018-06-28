## load libraries
library(dplyr)
library(tidyr)
library(readr)
library(xlsx)

## rad raw data downloaded from (https://www.transparency.org/cpi2015#downloads)
cpi_data <- read.xlsx(paste0(here::here(), "/data-raw/cpi_2015.xlsx"),
                 sheetName = 'CPI 2015')

## rename and select desired fields
cpi_2015 <- cpi_data %>%
  rename(country = Country.Territory,
         country_code = Country.Code,
         rank = Country.Rank,
         region = Region,
         corruption_perception_index = CPI.2015.Score) %>%
  select(country, country_code, rank, region, corruption_perception_index) %>%
  as_tibble()


## add to package data
devtools::use_data(cpi_2015)
