library(readr)
library(tidyr)
library(dplyr)
library(ggplot2)
library(stringr)

files <- list.files(path = '../../zika/',
                    pattern = '[0-9]{4}-[0-9]{2}-[0-9]{2}.csv$',
                    recursive = TRUE,
                    full.names = TRUE)

tables <- lapply(files, readr::read_csv)

combined_df <- do.call(rbind , tables)

rm(files, tables)


parsed_location <- combined_df %>%
    tidyr::separate(col = location,
                    into = c('country', 'location2', 'location3'),
                    sep = '-',
                    fill = 'right')

country_cases <- combined_df %>%
    tidyr::separate(col = location,
                    into = c('country', 'location2', 'location3'),
                    sep = '-',
                    fill = 'right') %>%
    dplyr::filter(value > 0) %>%
    dplyr::count(country)
