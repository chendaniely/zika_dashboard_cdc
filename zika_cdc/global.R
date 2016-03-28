library(readr)
library(tidyr)
library(dplyr)
library(ggplot2)
library(stringr)
library(DT)
library(shinydashboard)

source('custom_functions/get_cdc_data.R')

source('ui_01_dashboardHeader.R')
source('ui_02_dashboardSidebar.R')

source('ui_03_dashboardBody.R')
source('ui_03_raw_data.R')

source('ui_01_01_github_dropdown.R')

source('custom_functions/my_notification_item.R')
source('custom_functions/github_dropdown_menu.R')

source('modules/dashboard_landing_page_ui.R')
source('modules/dashboard_landing_page_server.R')
source('modules/country_level_analysis_colombia_ui.R')
source('modules/country_level_analysis_colombia_server.R')


cdc_data_commit <- '05e6c978330da18ee5902cceabeab742f54294f2'

get_cdc_data(cdc_data_commit)

files <- list.files(path = sprintf('data/zika-%s', cdc_data_commit),
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
