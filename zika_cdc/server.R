server <- function(input, output) {


    shiny::callModule(country_level_analysis_colombia,
                      'country_level_analysis_colombia')

    shiny::callModule(dashboard_landing_page,
                      'dashboard_landing_page')

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
            lengthMenu = list(c(25, 50, 100, 1000),
                              c('25', '50', '100', '1000')),
            pageLength = 25
        )
    )
}
