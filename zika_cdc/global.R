library(readr)
library(tidyr)
library(dplyr)
library(ggplot2)
library(stringr)
library(DT)

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

colombia_data <- parsed_location %>%
    dplyr::filter(country == 'Colombia')

cumulative_country <-
    colombia_data %>%
    dplyr::mutate(value = as.numeric(value)) %>%
    dplyr::group_by(report_date, country) %>%
    summarize(cum_sum = sum(value))

cumulative_country_2 <-
    colombia_data %>%
    dplyr::mutate(value = as.numeric(value)) %>%
    dplyr::group_by(report_date, country, location2) %>%
    summarize(cum_sum = sum(value))

cumulative_country_3 <-
    colombia_data %>%
    dplyr::mutate(value = as.numeric(value)) %>%
    dplyr::group_by(report_date, country, location2, location3) %>%
    summarize(cum_sum = sum(value))
