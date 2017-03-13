library(shiny)

# Define server logic required to draw a histogram
shinyServer(
        function(input, output) {

                colm <- reactive({
                        as.numeric(input$var)
                })

                output$sum <- renderPrint({
                        summary(iris)
                })


                output$str <- renderPrint({
                        str(iris)

                })

                output$data <- renderTable({
                        iris[colm()]
                        head(iris)
                        # head(iris)

                })


                output$myhist <- renderPlot({
                        # generate bins based on input$bins from ui.R & draw the histogram with the specified number of bins
                        hist(iris[,colm()], breaks =seq(0, max(iris[,colm()]), l=input$bins+1),
                             col = input$color, main = "Histogram of the Iris data set",
                             xlab=names(iris[colm()]))
                })
        })
