library(shiny)
shinyUI(fluidPage(
        titlePanel("Predict Ozone from Temp in Model 1 or a Temp & Solar.R combination in Model 2"),
        sidebarLayout(
                sidebarPanel(
                        sliderInput("sliderTemp", "For prediction Model 1 input the desired Temperature?", 60, 100, value = 80),
                        sliderInput("sliderSolar.R", "For prediction Model 2 input the estmated Solar.R?", 40, 150, value = 100),
                        checkboxInput("showModel1", "Show/Hide model1", value = TRUE),
                        checkboxInput("showModel2", "Show/Hide model2", value = TRUE),
                        submitButton("Submit")
                ),
                mainPanel(
                        plotOutput("plot"),
                        h3("Predicted Ozone from model1:"),
                        textOutput("pred1"),
                        h3("Predicted Ozone from model2:"),
                        textOutput("pred2")
                ),
        )
))

