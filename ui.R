library(shinydashboard)

source('ui_01_dashboardHeader.R')
source('ui_02_dashboardSidebar.R')
source('ui_03_dashboardBody.R')

dashboardPage(
    dashboard_header(),
    dashboard_sidebar(),
    dashboard_body()
)
