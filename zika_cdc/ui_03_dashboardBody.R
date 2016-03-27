library(shinydashboard)

dashboard_body <- function(){
    dashboardBody(
        tags$head(includeScript("google_analytics.js")),
        tabItems(
            main_dashboard_page(),
            #colombia(),
            country_level_analysis_colombia_UI('country_level_analysis_colombia'),
            raw_data()
        )
    )
}
