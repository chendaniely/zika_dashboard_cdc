library(shinydashboard)

main_dashboard_page <- function(){
    tabItem(tabName = "dashboard",

            fluidRow(
                infoBoxOutput("basic_stat_nrow"),
                infoBoxOutput("basic_stat_ndays"),
                infoBoxOutput("basic_stat_ncountry")
            ),

            fluidRow(
                box(title = "Number of valid data points per country",
                    status = "primary",
                    solidHeader = TRUE,
                    plotOutput('basic_stat_plot_ncases'),
                    "Number of non-missing, and cases greater than 0 per country"
                )
            )
    )
}
