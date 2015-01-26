library(datasets)
library(car)
data(mtcars)

fit <- function(var) {
  frm <- paste("mpg ~ ", paste(var,collapse = " + "))
  print(frm)
  lm(frm, data=mtcars)
}

shinyServer(  
  function(input, output) {
    fit <- ''
    output$residualPlot <- renderPlot({
      if (length(input$variable) > 0) {        
        qqPlot(fit(input$variable))
      }
      #runApp()
    })        
    output$rsquared <- renderText({
      if (length(input$variable) > 0) {        
        as.character(round(summary(fit(input$variable))$r.squared, digits = 3))
      }
    })
    output$fstatistic <- renderText({
      if (length(input$variable) > 0) {
        as.character(round(summary(fit(input$variable))$fstatistic[1], digits = 3))
      }
    })
    output$sigma <- renderText({
      if (length(input$variable) > 0) {
        as.character(round(summary(fit(input$variable))$sigma, digits = 3))
      }
    })    
  }
)