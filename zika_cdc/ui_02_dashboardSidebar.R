dashboard_sidebar <- function(){
    dashboardSidebar(
        sidebarMenu(
            menuItem("Dashboard", tabName = "dashboard", icon = icon("dashboard")),
            menuItem("Country Level Analysis", icon = icon('globe'),
                     menuSubItem("Colombia", tabName = "colombia")
            ),
            menuItem("View Data", tabName = "raw_data", icon = icon("fa fa-download"))
        )
    )
}
