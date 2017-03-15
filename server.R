library(shiny)
library(dplyr)
data(airquality)
library(ggplot2)


acc <- airquality[complete.cases(airquality),]
str(acc)

shinyServer(function(input, output) {

        model1 <- lm(Ozone ~ Temp, data = acc)
        model2 <- lm(Ozone ~ Solar.R, data = acc)

        sc <- summary(model1)$coefficients
        ci1 <- sc[1,1]+c(-1,1)*qt(.975,df=model1$df)*sc[1,2]
        ci1

        sc <- summary(model2)$coefficients
        ci2 <- sc[1,1]+c(-1,1)*qt(.975,df=model2$df)*sc[1,2]
        ci2

        model1pred <- reactive({
                TempInput <- input$sliderTemp
                predict(model1, newdata = data.frame(Temp = TempInput))
        })

        model2pred <- reactive({
                TempInput <- input$sliderTemp
                SolarInput <- input$sliderSolar.R
                predict(model2, newdata = data.frame(Temp = TempInput, Solar.R = SolarInput))

        })
        output$plot1 <- renderPlot({
                TempInput <- input$sliderTemp
                plot(acc$Temp, acc$Ozone, xlab = "Temperature",
                     ylab = "Ozone in PPM", bty = "n", pch = 16,
                     xlim = c(-10, 120), ylim = c(0, 170))
                if(input$showModel1){
                        abline(model1, col = "red", lwd = 2)
                }
                legend(-10, 120, c("Model 1 Prediction"), pch = 16,
                       col = "red", bty = "n", cex = 1.2)
                points(TempInput, model1pred(), col = "red", pch = 16, cex = 2)



                })
        output$plot2 <- renderPlot({
                SolarInput <- input$sliderSolar.R
                plot(acc$Solar.R, acc$Ozone, xlab = "Solar.R",
                     ylab = "Ozone in PPM", bty = "n", pch = 16,
                     xlim = c(0, 350), ylim = c(0, 170))
                if(input$showModel2){
                        abline(model2, col = "blue", lwd = 2)
                }
                legend(40, 350, c("Model 2 Prediction"), pch = 16,
                       col = "blue", bty = "n", cex = 1.2)
                points(SolarInput, model2pred(), col = "blue", pch = 16, cex = 2)
        })
        output$pred1 <- renderText({
                model1pred()

        })
        output$pred2 <- renderText({
                model2pred()

        })
})
























