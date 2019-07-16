library(shiny)
library(shinythemes)
library(combinat)
#UI
#Uses the fluidPage function to automatically adjust to the dimensions of browser's window
source("fubukiSolverFin.r")
#------------------------------------------------------------------#
ui <- fluidPage(theme = shinytheme("darkly"),
  h1(titlePanel("Fubuki Solver")), 
  
  #sidebarLayout always takes 2 args: sidebarPanel and mainPanel
  sidebarLayout(
    sidebarPanel(img(src = "fubukiPic.png", width = "100%"),

                 selectInput("selectPos", label = ("Please select a position for prefilled value:"),
                             choices = list("a1" = 1, "a2" = 2, "a3" = 3, "a4" = 4, "a5" = 5,
                                            "a6" = 6, "a7" = 7, "a8" = 8, "a9" = 9),
                             selected = 5
                             ),
                
                 sliderInput("selectVal", "Please choose value for chosen position:",
                             min = 1, max = 9, value=2
                             ),
                 
                 numericInput("R1Val", label = ("Please choose R1 value:"), value = 17),
                 numericInput("R2Val", label = ("Please choose R2 value:"), value = 15),
                 numericInput("R3Val", label = ("Please choose R3 value:"), value = 13),
                 numericInput("C1Val", label = ("Please choose C1 value:"), value = 16),
                 numericInput("C2Val", label = ("Please choose C2 value:"), value = 11),
                 numericInput("C3Val", label = ("Please choose C3 value:"), value = 18),
                 
                 actionButton("calculate", label = "Submit", class="btn btn-success")
                 
                 
                 ),
    
    mainPanel(
      h3(textOutput("solutionNum")),
      p(verbatimTextOutput("userVal"))
      #h3("You have now solved your fubuki puzzles. Please enjoy and practice around")
      
    )

  )
  
)

#ServerLogic
#------------------------------------------------------------------#
server <- function(input, output){
  
  observeEvent(input$calculate, {
    
    output$solutionNum <- renderText({
      fubukiSolutions(fubukiSolver1(pos=as.numeric(input$selectPos), 
                                    input$selectVal,
                                    input$R1Val,
                                    input$R2Val,
                                    input$R3Val,
                                    input$C1Val,
                                    input$C2Val,
                                    input$C3Val))})
                                    
    
    output$userVal <- renderPrint({
        fubukiSolver1(pos=as.numeric(input$selectPos), 
                      input$selectVal,
                      input$R1Val,
                      input$R2Val,
                      input$R3Val,
                      input$C1Val,
                      input$C2Val,
                      input$C3Val)
        
      })
    
   
  })
 
}

#Run App
#------------------------------------------------------------------#
shinyApp(ui = ui, server = server)

  