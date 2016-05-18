library(ggplot2)
data(mtcars)
fit_auto <- lm(mpg ~ wt, data = subset(mtcars, wt < 4 & am == 0))
fit_man <- lm(mpg ~ wt, data = subset(mtcars, wt < 4 &am == 1))

shinyServer(
  
  function(input, output) {
    output$weight <- renderText({input$weight})
    output$trans <- renderText({input$trans})
    
    output$prediction = renderText({
      if(input$trans == "Automatic"){signif(predict(fit_auto, data.frame(wt = input$weight/1000)), 3)
        } else {
          signif(predict(fit_man, data.frame(wt = input$weight/1000)),3)
          }})
    
    output$plot = renderPlot({
        if(input$trans == "Automatic"){
            g <- ggplot(subset(mtcars, am == 0 & wt < 4), aes(x = wt, y = mpg))
            g <- g + ggtitle("MPG vs. Weight")
            g <- g + xlab("Vehicle Weight in Thousands of Pounds (wt)")
            g <- g + ylab("Miles Per Gallon (mpg)")
            g <- g + stat_smooth(method = lm, aes(color = "red", fill = "red"), alpha = 0.2)
            g <- g + geom_point(size =4, alpha = 0.8, color = "blue")
            g <- g + geom_vline(xintercept = input$weight/1000, color = "green", size = 1)
            g <- g + theme(legend.position="none")
            g
      
        } else {
      
            g <- ggplot(subset(mtcars, am == 1 & wt < 4), aes(x = wt, y = mpg))
            g <- g + ggtitle("MPG vs. Weight")
            g <- g + xlab("Vehicle Weight in Thousands of Pounds (wt)")
            g <- g + ylab("Miles Per Gallon (mpg)")
            g <- g + stat_smooth(method = lm, aes(color = "red", fill = "red"), alpha = 0.2)
            g <- g + geom_point(size =4, alpha = 0.8, color = "blue")
            g <- g + geom_vline(xintercept = input$weight/1000, color = "green", size = 1)
            g <- g + theme(legend.position="none")
            g
        }
    
      }) # End of if/else
    
    } # End of input/output function
  
  ) # End of ShinyServer function

