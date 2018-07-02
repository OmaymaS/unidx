## load libraries
library(dplyr)
library(tidyr)
library(readr)
library(xlsx)

## HDI Data --------------------------------------------------------------------
## read raw data downloaded from (source: http://hdr.undp.org/en/data#)
hdi_data <- read_csv(paste0(here::here(), "/data-raw/hdi_19002015.csv"))

hdi_data <- hdi_data %>%
  rename(country = Country) %>%
  mutate(country = as.factor(country))

## remove HDI Rank (2015) from hdi_data wide format
hdi_wide <- hdi_data %>%
  select(- `HDI Rank (2015)`,
         country)

## convert hdi_data from wide to long
hdi <- hdi_data %>%
  select(- `HDI Rank (2015)`,
         country) %>%
  gather(year, human_development_index, - country)

## get country with hdi rank in 2015
hdi_rank_2015 <- hdi_data %>%
  select(country,
         hdi_rank = `HDI Rank (2015)`)

## extract hdi 2015
hdi_2015 <- hdi %>%
  filter(year == 2015) %>%
  inner_join(hdi_rank_2015)

## addhdi_wide, hdi, hdi_2015 to package data
devtools::use_data(hdi_wide, hdi, hdi_2015, overwrite = TRUE)


## CPI Data --------------------------------------------------------------------
## rad raw data downloaded from (https://www.transparency.org/cpi2015#downloads)
cpi_data <- read.xlsx(paste0(here::here(), "/data-raw/cpi_2015.xlsx"),
                 sheetName = 'CPI 2015')

## rename and select desired fields
cpi_2015 <- cpi_data %>%
  rename(country = Country.Territory,
         country_code = Country.Code,
         cpi_rank = Country.Rank,
         region = Region,
         corruption_perception_index = CPI.2015.Score) %>%
  select(country, country_code, cpi_rank, region, corruption_perception_index) %>%
  as_tibble()


## add cpi_2015 to package data
devtools::use_data(cpi_2015, overwrite = TRUE)

## 2015 POPULATION -------------------------------------------------------------
## read gapminder population data (source: https://docs.google.com/spreadsheet/pub?key=phAwcNAVuyj0XOoBL_n5tAQ&output=xlsx)
pop_data <- read.xlsx(paste0(here::here(), "/data-raw/indicator gapminder population.xlsx"),
                      sheetName = 'Data')

## select 2015 population data
pop_2015 <- pop_data %>%
  select(country = Total.population,
         population = X2015)

## COMBINE HDI CPI Data 2015 ---------------------------------------------------

## load gapminder
library(gapminder)

## get country-continent pairs from gapminder
gapminder_cont <- gapminder %>%
  filter(year == 2007) %>%
  select(country, continent)

## join hdi, cpi and continents data for 2015
hdi_cpi_2015 <- hdi_2015 %>%
  inner_join(cpi_2015) %>%
  inner_join(gapminder_cont) %>%
  left_join(pop_2015) %>%
  mutate(country = as.factor(country))

## modify the order of the columns
hdi_cpi_2015 <- hdi_cpi_2015 %>%
  select(country, country_code, region, continent, population, corruption_perception_index, cpi_rank, human_development_index, hdi_rank, year)

## add hdi_cpi_2015 to package data
devtools::use_data(hdi_cpi_2015, overwrite = TRUE)
