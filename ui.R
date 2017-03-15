library(shiny)
shinyUI(fluidPage(
        titlePanel(title = h1("Predicting Ozone PPM based on Temperature or Solar.R", align = "center")),
        br(),
        sidebarLayout(
                sidebarPanel(
                        sliderInput("sliderTemp", "For prediction Model 1 input the desired Temperature in degrees F?", 50, 120, value = 60),
                        sliderInput("sliderSolar.R", "For prediction Model 2 input the estmated Solar.R in W/m^2?", 5, 350, value = 100),
                        checkboxInput("showModel1", "Show/Hide model1", value = TRUE),
                        checkboxInput("showModel2", "Show/Hide model2", value = TRUE),
                        submitButton("Submit")
                ),
                mainPanel(
                        br(),
                        titlePanel(title=h3("Prediction of Ozone from Temperature Model 1", align = "center")),
                        plotOutput("plot1"),
                        textOutput("pred1"),
                        br(),
                        titlePanel(title=h3("Prediction of Ozone from Solar.R Model 2", align = "center")),
                        plotOutput("plot2"),
                        textOutput("pred2"),
                        br()
                ),
        )
))

