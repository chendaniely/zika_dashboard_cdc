server <- function(input, output) {


    shiny::callModule(country_level_analysis_colombia,
                      'country_level_analysis_colombia')

    shiny::callModule(dashboard_landing_page,
                      'dashboard_landing_page')

    output$countries <- renderUI({
        selectInput(
            'country_selectize', 'Select Country',
            choices = unique(parsed_location$country)
        )
    })

    output$data_fields <- renderUI({
        data_field_options <- unique(parsed_location[parsed_location$country == input$country_selectize, "data_field"])
        data_field_options <- as.list(data_field_options$data_field)
        names(data_field_options) <- data_field_options

        checkboxGroupInput(
            'country_data_fields', 'Select Data Fields',
            choices = data_field_options,
            selected = data_field_options
        )
    })

    data_filtered_fields <- reactive({
        return(parsed_location[parsed_location$data_field %in% input$country_data_fields, ])
    })

    data_filtered_cum_asis <- reactive({
        print(head(data_filtered_fields()))
        cumulative_country <- data_filtered_fields() %>%
            dplyr::mutate(value = as.numeric(value)) %>%
            dplyr::group_by(report_date, country) %>%
            dplyr::summarize(sum = sum(value, na.rm = TRUE))

        if (input$cum_as_is == 'cumulative') {
            cumulative_country$sum <- cumsum(cumulative_country$sum)
            return(cumulative_country)
        } else {
            return(cumulative_country)
        }
    })

    output$dt_filtered_fields <- DT::renderDataTable(
        data_filtered_fields()
    )

    output$dt_filtered_sums <- DT::renderDataTable(
        data_filtered_cum_asis()
    )

    output$plot_country_sum <- renderPlot({
        ggplot(data = data_filtered_cum_asis(),
               aes(x = as.Date(report_date), y = sum)) +
            theme_bw() +
            geom_line() +
            xlab("Date") +
            ylab("Cases") +
            theme(legend.position = "none",
                  axis.text.x = element_text(angle = 45,
                                             hjust = 1))
    })

    output$download_parsed_location <- downloadHandler(
        filename = function() {
            paste('cdc_parsed_location', '.csv', sep = '')
        },
        content = function(file) {
            write.csv(parsed_location, file)
        }
    )

    output$parsed_location = DT::renderDataTable(
        parsed_location,
        options = list(
            lengthMenu = list(c(25, 50, 100, 1000),
                              c('25', '50', '100', '1000')),
            pageLength = 25
        )
    )
}
