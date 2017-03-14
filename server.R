library(shiny)
library(dplyr)

shinyServer(function(input, output) {

        model1 <- lm(Ozone ~ Temp, data = acc)
        model2 <- lm(Ozone ~ Solar.R, data = acc)

        model1pred <- reactive({
                TempInput <- input$sliderTemp
                predict(model1, newdata = data.frame(Temp = TempInput))
        })

        model2pred <- reactive({
                TempInput <- input$sliderTemp
                SolarInput <- input$sliderSolar.R
                predict(model2, newdata = data.frame(Temp = TempInput, Solar.R = SolarInput))
})
        output$plot <- renderPlot({
                TempInput <- input$sliderTemp
                SolarInput <- input$sliderSolar.R
                plot(acc$Temp, acc$Ozone, xlab = "Temp",
                     ylab = "Ozone in PPM", bty = "n", pch = 16,
                     xlim = c(40, 150), ylim = c(0, 170))
                if(input$showModel1){
                        abline(model1, col = "red", lwd = 2)
                }
                if(input$showModel2){
                        abline(model2, col = "blue", lwd = 2)
                }
                legend(40, 150, c("Model 1 Prediction", "Model 2 Prediction"), pch = 16,
                       col = c("red", "blue"), bty = "n", cex = 1.2)
                points(TempInput, model1pred(), col = "red", pch = 16, cex = 2)
                points(SolarInput, model2pred(), col = "blue", pch = 16, cex = 2)
        })

        output$pred1 <- renderText({
                model1pred()
        })

        output$pred2 <- renderText({
                model2pred()
        })
})
























