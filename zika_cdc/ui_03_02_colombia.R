library(shinydashboard)

colombia <- function(){
    tabItem(tabName = "colombia",
            fluidRow(
                box(width = 4,
                    plotOutput('colombia_cum_cases')
                ),
                box(width = 4,
                    plotOutput('colombia_location2_cum_cases')
                ),
                box(width = 4,
                    plotOutput('colombia_location3_cum_cases')
                )
            ),
            fluidRow(
                box(width = 12,
                    plotOutput('colombia_location3_cum_cases_facet',
                               height = 600)
                )
            )
    )
}
