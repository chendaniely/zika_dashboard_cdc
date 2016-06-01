dashboard_body <- function(){
    dashboardBody(
        tags$head(includeScript("google_analytics.js")),
        tabItems(
            #main_dashboard_page(),
            dashboard_landing_page_UI('dashboard_landing_page'),
            country_level_analysis_colombia_UI('country_level_analysis_colombia'),

            tabItem(tabName = "general_country",
                    fluidRow(
                        column(width = 3,
                               box(
                                   title = "Box title", width = NULL, status = "primary",
                                   uiOutput("countries"),
                                   radioButtons("cum_as_is", "Plot options",
                                                choices = list("Cumulative" = 'cumulative',
                                                               "As-is" = 'as_is'),
                                                selected = 'cumulative'),
                                   uiOutput("data_fields")
                               )
                        ),

                        column(width = 9,
                               #box(
                                   tabsetPanel(type = "tabs",
                                               tabPanel("Cases: Country", plotOutput("plot_country_sum")),
                                               #tabPanel("Cumulative Cases 2", verbatimTextOutput("under_construction")),
                                               #tabPanel("Cumulative Cases 3", verbatimTextOutput("under_construction")),
                                               tabPanel("Selected Data", DT::dataTableOutput('dt_filtered_fields')),
                                               tabPanel("Selected Data Sum", DT::dataTableOutput('dt_filtered_sums'))
                                   )
                               #)
                        )
                    )
            ),

            raw_data()
        )
    )
}
