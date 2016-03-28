Shiny Dashboard for CDC Zika data
================

-   [Overview](#overview)
-   [Setup](#setup)
    -   [R](#r)
    -   [Data](#data)
        -   [Git](#git)
        -   [Manually download repositories](#manually-download-repositories)
-   [Running/Vieweing the App](#runningvieweing-the-app)
    -   [Within Rstudio](#within-rstudio)
    -   [Command line](#command-line)
        -   [Using R Console](#using-r-console)
        -   [Using Shell](#using-shell)
    -   [Website](#website)
-   [About](#about)

Overview
========

Shiny Dashboard for [CDC Zika data](https://github.com/cdcepi/zika)

Setup
=====

R
-

`install.packages(c('shiny', 'shinydashboard', 'readr', 'tidyr', 'dplyr', 'ggplot2', 'stringr', 'DT'))`

Data
----

Currently this repository depends on the [CDC Zika repository](https://github.com/cdcepi/zika). You need to have a `zika` folder with all the contents of the CDC Zika repository as a sibling directory as this repository.

That is, you need the following folder structure

    Some folder to keep everything in
    |
    |- zika/                  # directory for the CDC zika reporitory
    |
    +- zika_dashboard_cdc/    # directory for this repository

### Git

If you know your way around git, got to a clean directory that is not already under version control and run

``` bash
git clone https://github.com/chendaniely/zika_dashboard_cdc.git
git clone https://github.com/cdcepi/zika.git
```

### Manually download repositories

If you do not know your way around git, simply go to the [CDC Zika repository](https://github.com/cdcepi/zika) and [this repository](https://github.com/chendaniely/zika_dashboard_cdc),

click the `Download Zip` button for each of the pages, and extract them into separate folders with the names mentioned above.

Running/Vieweing the App
========================

Within Rstudio
--------------

Open up either the `server.R` or `ui.R` file in RStudio, Right below the file tabs, there will be a `Run App` Button that will launch the Shiny App.

Command line
------------

### Using R Console

Navigate into the project folder

``` r
shiny::runApp('zika_cdc')
```

### Using Shell

Navigate into the project folder

``` bash
Rscript -e 'shiny::runApp('zika_cdc')'
```

Open a browser and navigate to the 'listening' link (e.g., `http://127.0.0.1:6593`)

Website
-------

The app is currently deployed here: <https://chendaniely.shinyapps.io/zika_cdc_dashboard/>

About
=====

[I](chendaniely.github.io) (Daniel Chen @chendaniely) am a graduate student at [Virginia Tech](https://www.vt.edu/index.html) in [Genetics, Bioinformatics, and Computational Biology](http://gbcb.vbi.vt.edu/). I work in the [Social and Decison Analytics Laboratory](https://www.bi.vt.edu/sdal) and sit with the Public Health and fellow computational epidemiologists in the [Network Dynamics and Simulation Science Laboratory](https://www.bi.vt.edu/ndssl). Both labs are part of the [Biocomplexity Institute of Virginia Tech](https://www.bi.vt.edu/).

This project started as part of a larger project with Bryan Lewis (@bryanleroylewis), James Schlitt (@jschlitt84), and Pyrros (Alex) Telionis.
