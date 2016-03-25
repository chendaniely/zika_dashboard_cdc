library(shinydashboard)

raw_data <- function(){
    tabItem(tabName = "raw_data",
            fluidRow(downloadButton('download_parsed_location', 'Download')),
            br(),
            fluidRow(
                DT::dataTableOutput('parsed_location')
            )
    )
}
