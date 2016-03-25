library(shinydashboard)

dashboard_body <- function(){
    dashboardBody(
        tags$head(includeScript("google_analytics.js")),
        tabItems(
            main_dashboard_page(),
            colombia(),
            raw_data()
        )
    )
}
