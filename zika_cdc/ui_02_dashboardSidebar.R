dashboard_sidebar <- function(){
    dashboardSidebar(
        sidebarMenu(
            menuItem("Dashboard", tabName = "dashboard", icon = icon("dashboard")),
            menuItem("Country Level Analysis", icon = icon('globe'),
                     menuSubItem("Colombia", tabName = "colombia")
            ),
            menuItem("Country Level Analysis 2", tabName = "general_country", icon = icon('globe')),
            menuItem("View Data", tabName = "raw_data", icon = icon("fa fa-download"))
        )
    )
}
