github_dropdown <- function(){
    github_dropdown_menu(
        type = "messages",
        icon = icon("github"),
        badgeStatus = 'info',

        my_notification_item(
            text = "Dashboard",
            icon = icon("github-alt"),
            href = 'https://github.com/chendaniely/zika_dashboard_cdc',
            newtab = TRUE

        ),

        my_notification_item(
            text = "CDC Data",
            icon = icon("github-square"),
            href = 'https://github.com/cdcepi/zika',
            newtab = TRUE
        )
    )
}
