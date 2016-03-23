library(shinydashboard)

my_notification_item <- function(text,
                                 icon = shiny::icon("warning"),
                                 status = "success",
                                 href = NULL,
                                 newtab = FALSE) {
    shinydashboard:::tagAssert(icon, type = "i")
    shinydashboard:::validateStatus(status)
    if (is.null(href))
        href <- "#"
    icon <- tagAppendAttributes(icon, class = paste0("text-",
                                                     status))
    if (newtab) {
        tags$li(a(href = href, icon, text, target = '_blank'))
    }
    else{
        tags$li(a(href = href, icon, text))
    }

}
