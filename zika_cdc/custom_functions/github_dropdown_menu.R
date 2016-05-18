github_dropdown_menu <- function(...,
                                 type = c("messages", "notifications", "tasks"),
                                 badgeStatus = "primary",
                                 icon = NULL,
                                 .list = NULL){
    type <- match.arg(type)
    if (!is.null(badgeStatus))
        shinydashboard:::validateStatus(badgeStatus)
    items <- c(list(...), .list)
    lapply(items, shinydashboard:::tagAssert, type = "li")
    dropdownClass <- paste0("dropdown ", type, "-menu")
    if (is.null(icon)) {
        icon <- switch(type, messages = shiny::icon("envelope"),
                       notifications = shiny::icon("warning"), tasks = shiny::icon("tasks"))
    }
    numItems <- length(items)
    if (is.null(badgeStatus)) {
        badge <- NULL
    }
    else {
        badge <- span(class = paste0("label label-", badgeStatus),
                      numItems)
    }
    tags$li(class = dropdownClass,
            a(href = "#", class = "dropdown-toggle",
              `data-toggle` = "dropdown", icon, badge),
            tags$ul(class = "dropdown-menu",
                    tags$li(class = "header",
                            # paste("You have", numItems, type)), # original
                            paste("Links to github source")),
                    tags$li(tags$ul(class = "menu", items))))
}
