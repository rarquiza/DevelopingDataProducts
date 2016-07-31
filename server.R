library(ggplot2)
library(datasets)
data(women)
lmMod <- lm(weight ~ height, data = women)

shinyServer(  
  function(input, output) {    
    output$inputValue <- renderPrint({input$height})
    # Calculate the prediction using the linear regression model
    predicted <- renderText({
        test_df <- data.frame(height={input$height}, weight=0)
        round(predict(lmMod, newdata=test_df),digits=4)
    })
    
    output$prediction <- renderPrint({
      as.numeric(predicted())
    })
    output$myScatterPlot <- renderPlot({
      p <- ggplot(women,aes(height, weight)) + geom_point(size=2.5) + geom_smooth(method="lm",se=TRUE,size=1,colour="red") + xlab("Height (in.)") + ylab("Weight (lb.)") + xlim(57,72) + ylim(109, 161)
      p <- p + geom_vline(xintercept = {input$height}, colour='blue') 
      p <- p + geom_hline(yintercept = as.numeric(predicted()), colour='blue')
      p
    })
  }
)