Shiny Application Project
========================================================
author: James C. Walmsley
date: March 13, 2017
autosize: false


Project Goals
===

- Develop a web-hosted "Interactive Shiny Application"

- Produce a slidedeck with 5 slides to pitch the application


### Shiny Application Objectives
- Generate predictive outputs from user inputs
- Provide documentation for effective user interaction


Application Specifics
===
- Data preparation
- Apply a lm (linear model) with predictive capability
- Transform user inputs to predictive outputs
- Provide confidence intervals for prediction results
- Produce interactive graphics for viewing data, predictive results and model visualizations


First 6 rows of acc data frame
===

```r
knitr::kable(head(acc <- airquality[complete.cases(airquality),],6), caption = "First six rows of the acc data frame")
```



|   | Ozone| Solar.R| Wind| Temp| Month| Day|
|:--|-----:|-------:|----:|----:|-----:|---:|
|1  |    41|     190|  7.4|   67|     5|   1|
|2  |    36|     118|  8.0|   72|     5|   2|
|3  |    12|     149| 12.6|   74|     5|   3|
|4  |    18|     313| 11.5|   62|     5|   4|
|7  |    23|     299|  8.6|   65|     5|   7|
|8  |    19|      99| 13.8|   59|     5|   8|


Access to the application & slidedeck:
===
## Links:

[link](http://rpubs.com/jcwal/259519) Pitch Slide Deck Shiny Application


[link](http://jcwal2016.shinyapps.io/DDP_CourseProject/) Shiny Application












