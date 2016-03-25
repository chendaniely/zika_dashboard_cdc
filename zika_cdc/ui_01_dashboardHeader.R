library(shinydashboard)

dashboard_header <- function(){
    tags$head(includeScript("google_analytics.js"))
    dashboardHeader(
        title = "Basic dashboard",
        github_dropdown()
    )
}
