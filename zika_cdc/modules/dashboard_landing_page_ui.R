dashboard_landing_page_UI <- function(
    id, label = "dashboard_landing_page"){
    # create a namespace function usin gthe provided ID
    ns <- shiny::NS(id)

    tabItem(tabName = "dashboard",

            fluidRow(
                valueBoxOutput(ns("basic_stat_nrow"), width = 3),
                valueBoxOutput(ns("basic_stat_ndays"), width = 3),
                valueBoxOutput(ns("basic_stat_ncountry"), width = 3),
                valueBoxOutput(ns("data_version"), width = 3)
            ),

            fluidRow(
                box(title = "Number of valid data points per country",
                    status = "primary",
                    solidHeader = TRUE,
                    plotOutput(ns('basic_stat_plot_ncases')),
                    "Number of non-missing, and cases greater than 0 per country"
                )
            )
    )
}
