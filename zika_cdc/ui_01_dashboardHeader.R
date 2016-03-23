library(shinydashboard)

dashboard_header <- function(){
    dashboardHeader(
        title = "Basic dashboard",
        github_dropdown()
    )
}
