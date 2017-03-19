library(shiny)
shinyUI(fluidPage(
        titlePanel(title = h1("Predicting Ozone ppm based on Temperature or Solar Radiation Inputs", align = "center")),
        br(),
        sidebarLayout(
                sidebarPanel(
                        selectInput("var", "1. To view the the first ten rows of observations of a given variable in the acc subset of the airquality data set, first select the Data Tab to the right, then select a variable name from the drop down menu below, finally click the submit button to view results.", choices = c("Ozone"=1,"Solar.R"=2,"Wind"=3,"Temp"=4,"Month"=5,"Day"=6)),
                        br(),
                        submitButton("Submit"),
                        br(),
                        sliderInput("sliderTemp", "2. To get a prediction for ppm of Ozone using Model 1, first select the Model 1 Plot, Tab to the right, next select the desired Temperature input on the slider below, next click the submit button to view updates plot results, to see the Ozone prediction select the Modlel 1 Pred, Tab, and to see the confidence interval of Model 1select the Model 1 CI, Tab.", 61, 110, value = 71),
                        br(),
                        sliderInput("sliderSolar.R", "3. To get a prediction for ppm of Ozone using Model 2, first select the Model 2 Plot, Tab to the right, next select the desired Solar.R  input on the slider below, next click the submit button to view the updated plot results, to see the Ozone prediction from Model 2 select the Model 2 Pred, Tab, and to see the confidence interval of Model 2 select the Model 2 CI, Tab.", 5, 350, value = 75),
                        br(),
                        h4("4. View the summary() or structure() of the acc data with the Summary or Sturcture Tabs"),
                        br(),
                        br(),
                        h5(textOutput("counter")),
                        br(),
                        tags$style("body{background-color:tan; color:blue}"),
                        br()
                ),
                mainPanel(
                        tabsetPanel(type="tab",
                                tabPanel("Data", tableOutput("data")),
                                tabPanel("Summary", verbatimTextOutput("sum")),
                                tabPanel("Structure", verbatimTextOutput("str")),
                                tabPanel("Model 1 Plot", plotOutput("plot1")),
                                tabPanel("Model 1 Pred ", verbatimTextOutput("pred1")),
                                tabPanel("Model 1 CI", verbatimTextOutput("ci1")),
                                tabPanel("Model 2 Plot", plotOutput("plot2")),
                                tabPanel("Model 2 Pred", verbatimTextOutput("pred2")),
                                tabPanel("Model 2 CI" , verbatimTextOutput("ci2"))
                                    ),
                        br()
                ),
        )
))

