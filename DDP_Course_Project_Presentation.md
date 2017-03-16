Predictive Shiny Application Project
========================================================
author: James C. Walmsley
date: March 13, 2017
autosize: false


Project Goals
===

- Develop a web-hosted "Interactive Shiny Application""

- Produce a web-hosted presentation pitch for the application


Shiny Application
===

- Application uses R code to generate outputs from user inputs
- Provide sufficient user documentation


Application Specifics
===
1. Prepare the data
1. Apply a lm (linear model)
1. Transform user inputs to predictive outputs through R code
1. Provide predictive cofidence intervals
1. Produce interactive graphics for data, predictive and model visualization


Accessing the Shiny Application
===
#[link](http://www.)
#[link](http://www.)











<!-- Relating Ozone & Temperature -->
<!-- ======================================================== -->
<!-- ```{r, echo=FALSE, results='hide'} -->
<!-- local({r <- getOption("repos") -->
<!--        r["CRAN"] <- "http://cran.r-project.org" -->
<!--        options(repos=r) -->
<!-- }) -->
<!-- acc <<- airquality[complete.cases(airquality),] -->
<!-- summary(acc) -->
<!-- install.packages("ggplot2") -->
<!-- library(ggplot2) -->
<!-- ``` -->

<!-- ```{r, Ozone vs Temp, echo=FALSE} -->
<!-- ggplot(acc, aes(Temp, Ozone)) + -->
<!--         geom_point() + -->
<!--         geom_smooth(method = "loess", se = FALSE) -->
<!-- ``` -->

<!-- Relating Ozone & Solar Radiation -->
<!-- ========================================================= -->
<!-- ```{r, Ozone vs Solar.R, echo=FALSE} -->
<!-- ggplot(acc, aes(Solar.R, Ozone)) + -->
<!--         geom_point() + -->
<!--         geom_smooth(method = "loess", se = FALSE) -->
<!-- ``` -->








