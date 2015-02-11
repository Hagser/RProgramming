library(shiny)

shinyUI(
  pageWithSidebar(
  headerPanel("Calculate BMI (body mass index)!"),
  sidebarPanel(
      numericInput('weight',"Weight (lbs or kg)",75,min=30,max=500,step=5),
      radioButtons("wtype","Lbs or kg",choices = c("Lbs","kg"),selected = "kg"),
      numericInput('height',"Height (feet, cm or inches)",175,min=30,max=200,step=5),
      radioButtons("htype","Feet, cm or inches",choices = c("Feet","cm","Inches"),selected = "cm"),
      submitButton("Send")
    )
  ,
  mainPanel(
        h3("Calculated BMI (body mass index):"),
        verbatimTextOutput("bmi"),
        h4("Description"),
        verbatimTextOutput("bmidescription"),
        h5("Plotted"),
        plotOutput("plot",width = 480)
    )
  )
)