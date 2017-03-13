library(shiny)

# Define UI for application that draws a histogram
shinyUI(fluidPage(
        # Application title
        titlePanel(title = h2("Identifying Characteristics of Different Species in the Iris Data Set", align="center")),

        br(),
        br(),
        # Sidebar with a slider input for number of bins
        sidebarLayout(
        sidebarPanel(

                selectInput("var", "1. Select the desired variable from the iris dataset", choices = c("Sepal.Length" = 1, "Sepal.Width" = 2, "Petal.Length" = 3, "Petal.Width" =4), selected = 1),

                br(),


                sliderInput("bins",
                            "2. Select How Many BINs in the Histogram",
                        min = 5,
                        max = 25,
                        value = 15),

                br(),

                radioButtons("color", "3. Choose Histogram Color", choices = c("Green","Red","Yellow"), selected = "Red"),

                br()

                ),
                # Show a plot of the generated distribution
                mainPanel(
                tabsetPanel(
                        tabPanel("Summary", verbatimTextOutput("sum")),
                        tabPanel("Structure", verbatimTextOutput("str")),
                        tabPanel("Data", tableOutput("data")),
                        tabPanel("Plot", plotOutput("my_hist"))
                ),

                plotOutput("myhist"),

                br(),
                h5('References:'),
                tags$link("https://www.youtube.com/channel/UCbck9jjLpwj7U6HHNps_9Gw")
                ),
        )
))
