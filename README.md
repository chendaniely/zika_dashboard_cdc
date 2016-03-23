Shiny Dashboard for CDC Zika data
================

-   [Overview](#overview)
-   [Setup](#setup)
-   [Running/Vieweing the App](#runningvieweing-the-app)
    -   [Within Rstudio](#within-rstudio)
    -   [Command line](#command-line)
    -   [Website](#website)

Overview
========

Shiny Dashboard for [CDC Zika data](https://github.com/cdcepi/zika)

Setup
=====

`install.packages(c('shiny', 'shinydashboard'))`

Running/Vieweing the App
========================

Within Rstudio
--------------

Open up either the `server.R` or `ui.R` file in RStudio, Right below the file tabs, there will be a `Run App` Button that will launch the Shiny App.

Command line
------------

### Using R Console

Navigate into the app folder

``` r
shiny::runApp()
```

### Using Shell

Navigate into the app folder

``` bash
Rscript -e 'shiny::runApp()'
```

Open a browser and navigate to the 'listening' link (e.g., `http://127.0.0.1:6593`)

Website
-------

Still finding a place to host...
