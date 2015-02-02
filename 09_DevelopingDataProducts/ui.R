library(shiny)
shinyUI(
  pageWithSidebar(
  headerPanel("Data science!"),
  sidebarPanel(
    numericInput('id1',"Nisses",90,min=50,max=200,step=5),
    submitButton("Send")
    )
  ,
  mainPanel(
  h3("Voila"),
  verbatimTextOutput("id1"),
  h4("Doh!"),
  verbatimTextOutput("calc1")
    )
  )
)