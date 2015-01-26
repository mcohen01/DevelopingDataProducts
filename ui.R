shinyUI(pageWithSidebar(
  headerPanel("Linear Regression with mtcars"),
  sidebarPanel(
    h6(paste("This application uses the mtcars dataset to investigate the effects of",
             "multiple variables on the linear regression model. Selected variables",
             "below will be included in the formula used to build the linear regression",
             "model. Performance of the model is displayed along with a quantile plot.")),
    checkboxGroupInput("variable", "Predictor Variable:",
                       c("Transmission" = "am",
                         "Weight" = "wt",
                         "Cylinders" = "cyl",
                         "Displacement" = "disp",
                         "Horsepower" = "hp"))    
  ),
  mainPanel(        
    div(
      strong("F Statistic: "), 
      textOutput("fstatistic")),
    
    br(),  
    
    div(
      strong("Sigma: "), 
      textOutput("sigma")),
    
    br(),
    
    div(
      strong("R Squared: "), 
      textOutput("rsquared")),
    
    plotOutput('residualPlot')
  )
))

