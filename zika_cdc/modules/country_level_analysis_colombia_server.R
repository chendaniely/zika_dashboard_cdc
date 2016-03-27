library(shiny)

country_level_analysis_colombia <- function(input, output, session){
	output$colombia_cum_cases <- renderPlot({
        ggplot(data = cumulative_country,
               aes(x = as.Date(report_date), y = cum_sum)) +
            geom_line() +
            theme_bw() +
            ylim(0, 50000) +
            xlab("Date") +
            ylab("Cumulative Cases (confirmed/suspected)") +
            theme(axis.text.x  = element_text(angle=45, hjust=1))
    })

    output$colombia_location2_cum_cases <- renderPlot({
        ggplot(data = cumulative_country_2,
               aes(x = as.Date(report_date), y = cum_sum)) +
            theme_bw() +
            geom_line(aes(color=location2)) +
            ylim(0, 10000) +
            xlab("Date") +
            ylab("Cumulative Cases (confirmed/suspected)") +
            theme(axis.text.x  = element_text(angle=45, hjust=1))
    })

    output$colombia_location3_cum_cases <- renderPlot({
        ggplot(data = cumulative_country_3,
               aes(x = as.Date(report_date), y = cum_sum)) +
            theme_bw() +
            geom_line(aes(color=location3)) +
            xlab("Date") +
            ylab("Cumulative Cases (confirmed/suspected)") +
            theme(legend.position="none",
                  axis.text.x  = element_text(angle=45, hjust=1))
    })

    output$colombia_location3_cum_cases_facet <- renderPlot({
        ggplot(data = cumulative_country_3,
               aes(x = as.Date(report_date), y = cum_sum)) +
            theme_bw() +
            geom_line(aes(color=location3)) +
            xlab("Date") +
            ylab("Cumulative Cases (confirmed/suspected)") +
            theme(legend.position="none",
                  axis.text.x  = element_text(angle=45, hjust=1)) +
            facet_wrap(~location2, scales='free')
    })
}
