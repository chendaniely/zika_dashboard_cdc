dashboard_body <- function(){
    dashboardBody(
        tags$head(includeScript("google_analytics.js")),
        tabItems(
            #main_dashboard_page(),
            dashboard_landing_page_UI('dashboard_landing_page'),
            country_level_analysis_colombia_UI('country_level_analysis_colombia'),
            raw_data()
        )
    )
}
