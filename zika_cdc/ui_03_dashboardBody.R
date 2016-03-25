library(shinydashboard)

dashboard_body <- function(){
    dashboardBody(
        tabItems(
            main_dashboard_page(),
            raw_data()
        )
    )
}
