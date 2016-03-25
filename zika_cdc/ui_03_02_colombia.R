library(shinydashboard)

colombia <- function(){
    tabItem(tabName = "colombia",
            fluidRow(
                box(width = 12,
                    h1("Colombia")
                )
            ),
            fluidRow(
                box(width = 4,
                    title = "Cumulative cases Country",
                    plotOutput('colombia_cum_cases')
                ),
                box(width = 4,
                    title = "Cumulative cases Regions",
                    plotOutput('colombia_location2_cum_cases')
                ),
                box(width = 4,
                    title = "Cumulative cases City",
                    plotOutput('colombia_location3_cum_cases')
                )
            ),
            fluidRow(
                box(width = 12,
                    title = "Cumulative cases City by Regions",
                    plotOutput('colombia_location3_cum_cases_facet',
                               height = 800)
                )
            )
    )
}
