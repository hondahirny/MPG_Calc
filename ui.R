shinyUI(
  pageWithSidebar(
   
    headerPanel("Fuel Economy Calculator"),
    
    sidebarPanel(
        numericInput("weight", "Vehicle Weight in Pounds", 3000, min = 100, max = 5000, step = 100),
        radioButtons("trans","Transmission Type", c("Manual","Automatic")),
        submitButton("Submit")
        ),
    
    mainPanel(
      h3('Results of Prediction:'),
      h4('Vehicle Weight Entered:'),
      verbatimTextOutput("weight"),
      
      h4("Transmission Chosen:"),
      verbatimTextOutput("trans"),
      
      h4('Predicted Vehicle MPG:'),
      verbatimTextOutput("prediction"),
      
      h4("Plot of mtcars data for your transmission type:"),
      plotOutput("plot"),
      
      h3("Instructions for Use:"),
      h4("Enter vehicle weight in pounds, select transmission, then press SUBMIT.  
          Output will confirm your entries as well as provide a numerical fuel 
          economy prediction in miles per gallon or MPG."),
      h4("A plot of the original mtcars data and its linear model fit are 
          also provided for reference. The solid red line represents the linear fit, 
          while the shaded red area represents the 95% prediction bounds. A green
          vertical line will appear, which represents your entered car weight.  The
          intersection of the green line and red line will match the numerical MPG
          prediction value.")
      )
  )
)