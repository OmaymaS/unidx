## load libraries
library(here)
library(dplyr)
library(tidyr)
library(readr)

## read raw data downloaded from (source: http://hdr.undp.org/en/data#)
hdi_data <- read_csv(paste0(here(), "/data-raw/hdi_19002015.csv"))

## remove HDI Rank (2015) from hdi_data wide format
hdi_wide <- hdi_data %>%
  select(- `HDI Rank (2015)`)

## convert hdi_data from wide to long
hdi <- hdi_data %>%
  select(- `HDI Rank (2015)`) %>%
  rename(country = Country) %>%
  gather(year, human_development_index, -country)


devtools::use_data(hdi_wide, hdi, overwrite = TRUE)
