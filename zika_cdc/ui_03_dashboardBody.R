library(shinydashboard)

dashboard_body <- function(){
    dashboardBody(
        tabItems(
            # First tab content
            main_dashboard_page(),

            # Second tab content
            tabItem(tabName = "widgets",
                    h2("Widgets tab content")
            )
        )
    )
}
