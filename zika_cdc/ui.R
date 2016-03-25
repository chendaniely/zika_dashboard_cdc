library(shinydashboard)

source('ui_01_dashboardHeader.R')
source('ui_02_dashboardSidebar.R')

source('ui_03_dashboardBody.R')
source('ui_03_01_dashboard.R')
source('ui_03_raw_data.R')

source('ui_01_01_github_dropdown.R')

source('custom_functions/my_notification_item.R')
source('custom_functions/github_dropdown_menu.R')


dashboardPage(
    dashboard_header(),
    dashboard_sidebar(),
    dashboard_body()
)
