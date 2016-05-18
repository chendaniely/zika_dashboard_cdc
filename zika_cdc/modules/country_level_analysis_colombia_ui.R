country_level_analysis_colombia_UI <- function(
    id, label = "country_level_analysis_colombia"){
    # create a namespace function usin gthe provided ID
    ns <- shiny::NS(id)

    tabItem(tabName = "colombia",
            fluidRow(
                box(width = 12,
                    h1("Colombia")
                )
            ),
            fluidRow(
                box(width = 4,
                    title = "Cumulative cases Country",
                    plotOutput(ns('colombia_cum_cases'))
                ),
                box(width = 4,
                    title = "Cumulative cases Regions",
                    plotOutput(ns('colombia_location2_cum_cases'))
                ),
                box(width = 4,
                    title = "Cumulative cases City",
                    plotOutput(ns('colombia_location3_cum_cases'))
                )
            ),
            fluidRow(
                box(width = 12,
                    title = "Cumulative cases City by Regions",
                    plotOutput(ns('colombia_location3_cum_cases_facet'),
                               height = 800)
                )
            )
    )
}
