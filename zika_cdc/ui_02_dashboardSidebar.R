library(shinydashboard)

dashboard_sidebar <- function(){
    dashboardSidebar(
        sidebarMenu(
            menuItem("Dashboard", tabName = "dashboard", icon = icon("dashboard")),
            menuItem("Colombia", tabName = "colombia", icon = icon("th")),
            menuItem("View Data", tabName = "raw_data", icon = icon("th"))
        )
    )
}
