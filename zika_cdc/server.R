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

    output$data_version <- renderInfoBox({
        valueBox(
            substr(cdc_data_commit, 0, 7),
            "Data Version", icon = icon("github"),
            color = "aqua"
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

    output$colombia_cum_cases <- renderPlot({
        ggplot(data = cumulative_country, aes(x = as.Date(report_date), y = cum_sum)) +
            geom_line() +
            theme_bw() +
            ylim(0, 50000) +
            theme(axis.text.x  = element_text(angle=45, hjust=1))
    })

    output$colombia_location2_cum_cases <- renderPlot({
        ggplot(data = cumulative_country_2, aes(x = as.Date(report_date), y = cum_sum)) +
            theme_bw() +
            geom_line(aes(color=location2)) +
            ylim(0, 10000) +
            theme(axis.text.x  = element_text(angle=45, hjust=1))
    })

    output$colombia_location3_cum_cases <- renderPlot({
        ggplot(data = cumulative_country_3, aes(x = as.Date(report_date), y = cum_sum)) +
            theme_bw() +
            geom_line(aes(color=location3)) +
            theme(legend.position="none",
                  axis.text.x  = element_text(angle=45, hjust=1))
    })

    output$colombia_location3_cum_cases_facet <- renderPlot({
        ggplot(data = cumulative_country_3, aes(x = as.Date(report_date), y = cum_sum)) +
            theme_bw() +
            geom_line(aes(color=location3)) +
            theme(legend.position="none",
                  axis.text.x  = element_text(angle=45, hjust=1)) +
            facet_wrap(~location2, scales='free')
    })

    output$download_parsed_location <- downloadHandler(
        filename = function() {
            paste('cdc_parsed_location', '.csv', sep='')
        },
        content = function(file) {
            write.csv(parsed_location, file)
        }
    )

    output$parsed_location = DT::renderDataTable(
        parsed_location,
        options = list(
            lengthMenu = list(c(25, 50, 100, 1000), c('25', '50', '100', '1000')),
            pageLength = 25
        )
    )
}
