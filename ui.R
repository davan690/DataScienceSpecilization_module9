library(shiny)
shinyUI(fluidPage(
        titlePanel(title = h1("Predicting levels of ppm Ozone based on Temperature or Solar Radiation inputs", align = "center")),
        br(),
        sidebarLayout(
                sidebarPanel(
                        selectInput("var", "1. To view the the first ten rows of observations of a given variable in the acc subset of the airquality data set, first select the Data Tab to the right, then select a variable name from the drop down menu below, finally click the submit button located at the bottom of this panel to view results.", choices = c("Temp"=1,"Solar.R"=2,"Ozone"=3,"Wind"=4,"Month"=5,"Day"=6)),
                        br(),
                        sliderInput("sliderTemp", "2. To get a prediction for ppm of Ozone using Model 1, first select the Model 1 Plot Tab to the right, next select the desired Temperature input on the slider below, next click the submit button at the bottom of this panel to view plot results, to see the Ozone prediction select the Modlel 1 Pred, Tab, and to see the confidence interval of Model 1select the Model 1 CI, Tab.", 61, 110, value = 71),
                        br(),
                        sliderInput("sliderSolar.R", "3. To get a prediction for ppm of Ozone using Model 2, first select the Model 2 Plot Tab to the right, next select the desired Solar.R  input on the slider below, next click the submit button below to view the plot results, to see the Ozone prediction from Model 2 select the Model 2 Pred, Tab, and to see the confidence interval of Model 2 select the Model 2 CI, Tab.", 5, 350, value = 75),
                        br(),
                        h5("To view the results of the summary() or structure() functions on the acc data subset, select the respective Summary or Sturcture Tabs"),
                        br(),
                        submitButton("Submit"),
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

