library(shiny)

shinyUI(
  pageWithSidebar(
  headerPanel("Calculate BMI (body mass index)!"),
  sidebarPanel(        
        radioButtons("wtype","Lbs or kg",choices = c("Lbs","kg"),selected = "kg"),
        sliderInput('weight',"Weight (lbs or kg)",75,min=30,max=500,step=1),
        radioButtons("htype","cm or inches",choices = c("cm","Inches"),selected = "cm"),
        sliderInput('height',"Height (cm or inches)",175,min=30,max=220,step=1)
    )
  ,
  mainPanel(
        h3("Calculated BMI (body mass index):"),
        verbatimTextOutput("bmi"),
        h4("Description"),
        verbatimTextOutput("bmidescription"),
        plotOutput("plot",width = 480)
    )
  )
)