library(shiny) 

shinyUI(pageWithSidebar(  
  headerPanel("Prediction Using Linear Regression Model"),
  sidebarPanel(
    h5("The data source is from R package women dataset consisting of 15 rows of average heights and weights of American women."),
    h5("Using linear model, one can make prediction on weight given height."),
    h5("Enter in inches between 57 and 72 and the app will give you the plot and prediction of weight in pounds."),
    numericInput('height', 'Height in inches', 65, min = 57, max = 72, step = 1),
    submitButton('Submit')
  ), 

  mainPanel(    
    plotOutput('myScatterPlot'),
    h3('Results of prediction'),
    h4('You entered height in inches'),
    verbatimTextOutput("inputValue"),
    h4('Prediction in pounds'),
    verbatimTextOutput("prediction")
  )
))