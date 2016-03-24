server <- function(input, output) {
    set.seed(122)
    histdata <- rnorm(500)

    output$plot1 <- renderPlot({
        data <- histdata[seq_len(input$slider)]
        hist(data)
    })

    output$basic_stat_nrow <- renderInfoBox({
        valueBox(
            nrow(combined_df),
            "Rows of data", icon = icon("list"),
            color = "aqua"
        )
    })

    output$basic_stat_ndays <- renderInfoBox({
        valueBox(
            length(unique(combined_df$report_date)),
            "Days of data", ,
            icon = icon("calendar"),
            color = "blue"
        )
    })

    output$basic_stat_ncountry <- renderInfoBox({
        valueBox(
            combined_df %>%
                tidyr::separate(col = location,
                                into = c('country', 'location2', 'location3'),
                                sep = '-',
                                fill = 'right') %>%
                dplyr::select(country) %>%
                .$country %>%
                dplyr::n_distinct() - 1,
            "Countries",
            icon = icon("globe"),
            color = "light-blue"
        )
    })

    output$basic_stat_plot_ncases <- renderPlot({
        country_cases <- combined_df %>%
            tidyr::separate(col = location,
                            into = c('country', 'location2', 'location3'),
                            sep = '-',
                            fill = 'right') %>%
            dplyr::filter(value > 0) %>%
            dplyr::count(country)
        country_cases$country[is.na(country_cases$country)] <- "NA"

        ggplot(data = country_cases,
               mapping = aes(x = str_replace_all(country, '_', ' '), y = n, label = n)) +
            geom_bar(stat = "identity", na.rm = FALSE) +
            geom_text(aes(y = n + 0.05), position = position_dodge(0.9), vjust = 0, size = 5) +
            scale_y_continuous(trans = "log10") +
            labs(x = "Country",
                 y = 'Number of case data > 0 (log 10)') +
            theme_bw() +
            theme(axis.text.x  = element_text(angle = 45, hjust = 1))
    })

}
