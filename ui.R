library(shiny)

# Define UI for application that draws a histogram
shinyUI(fluidPage(
        # Application title
        titlePanel(title = h2("Identifying Characteristics of Different Species in the Iris Data Set", align="center")),

        br(),
        h5("Instructions:"),
        h6(" 1.) First, This Shiny Application enables you to select a varialbe from within the Iris data set from the drop down menu located at 1. on the left side of the screen."),
        h6(" 2.) Next, the selector located at 2. on the left of the screen allows you to modify the number of bins that are drawn in the plot of the resulting histogram according to your input within the given range."),
        h6(" 3.) Finally, You can adjust the color of the resulting higtogram plot by selecting one of three radio buttons provided at 3. on the lefts side of the screen."),
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
                        max = 50,
                        value = 15),

                br(),

                radioButtons("color", "3. Choose Histogram Color", choices = c("Green","Red","Yellow"), selected = "Red"),

                br()

                ),
                # Show a plot of the generated distribution
                mainPanel(
                        tabsetPanel(
#                        tabPanel("Plot", plotOutput("my_hist")),
                                tabPanel("Data", tableOutput("data")),
                                tabPanel("Summary", verbatimTextOutput("sum")),
                                tabPanel("Structure", verbatimTextOutput("str"))
                ),

                plotOutput("myhist"),

                br(),
                h5('References:'),
                tags$link("https://www.youtube.com/channel/UCbck9jjLpwj7U6HHNps_9Gw")
                ),
        )
))
