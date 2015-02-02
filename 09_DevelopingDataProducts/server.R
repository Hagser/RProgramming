library(shiny)
calc<-function(val){val/200}
shinyServer(
      
      function(input,output)
      {
            output$id1<-renderPrint({input$id1})
            output$calc1<-renderPrint({calc(input$id1)})
      }
)