library(shiny)
library(dplyr)
data(airquality)
library(ggplot2)

acc <<- airquality[complete.cases(airquality),]
str(acc)

shinyServer(function(input, output) {

        model1 <- lm(Ozone ~ Temp, data = acc)
        model2 <- lm(Ozone ~ Solar.R, data = acc)

        output$data <- renderTable({
                colm <- as.numeric(input$var)
                head(acc[colm],10)
                })
        output$sum <- renderPrint({
                summary(acc)
                })
        output$str <- renderPrint({
                str(acc)
                })
        output$plot1 <- renderPlot({
                TempInput <- input$sliderTemp
                plot(acc$Temp, acc$Ozone, xlab = "Temperature in degrees F",
                        ylab = "Ozone ppm", bty = "n", pch = 16,
                        xlim = c(61, 110), ylim = c(0, 170))
                        abline(model1, col = "red", lwd = 2)
                legend(60,160, c("Ozone prediction"), pch = 16,
                       col = "red", bty = "n", cex = 1.2)
                points(TempInput, model1pred(), col = "red", pch = 16, cex = 2)
                })
        output$pred1 <- renderText({
                round(model1pred(),2)
                })
        output$ci1 <- renderPrint({
                confint(model1)
                })
        output$plot2 <- renderPlot({
                SolarInput <- input$sliderSolar.R
                plot(acc$Solar.R, acc$Ozone, xlab = "Solar.R in W/m^2",
                        ylab = "Ozone ppm", bty = "n", pch = 16,
                        xlim = c(5, 350), ylim = c(0, 170),
                        abline(model2, col = "blue", lwd = 2))
                legend(5,160, c("Ozone prediction"), pch = 15,
                       col = "blue", bty = "n", cex = 1.2)
                points(SolarInput, model2pred(), col = "blue", pch = 15, cex = 2)
                })
        output$pred2 <- renderText({
                round(model2pred(),2)
                })
        output$ci2 <- renderPrint({
                confint(model2)
                })
        model1pred <- reactive({
                TempInput <- input$sliderTemp
                predict(model1, newdata = data.frame(Temp = TempInput))
                })
        model2pred <- reactive({
                SolarInput <- input$sliderSolar.R
                predict(model2, newdata = data.frame(Solar.R = SolarInput))
                })
        output$counter <-
                renderText({
                        if (!file.exists("counter.Rdata"))
                                counter <- 0
                        else
                                load(file = "counter.Rdata")
                        counter <- counter + 1
                        save(counter, file="counter.Rdata")
                        paste0("Hits: ", counter)
                })
})
























