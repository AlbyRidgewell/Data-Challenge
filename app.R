#
# This is a Shiny web application. You can run the application by clicking
# the 'Run App' button above.
#
# Find out more about building applications with Shiny here:
#
#    http://shiny.rstudio.com/
#

library(shiny)
library(medicaldata)
library(ggplot2)

# Define UI for application that draws a histogram
ui <- fluidPage(

    # Application title
    titlePanel("Baseline polyp count in malles and females")
    
    fluidRow(
      column(width=4,
             sliderInput("bins",
                         "Number of bins:",
                         min = 1,
                         max = 50,
                         value = 30),
             
             column(width=8,
              plotOutput("dat_table"))
    )

    
)

# Define server logic required to draw a histogram
server <- function(input, output) {
      
  output$distPlot <- renderPlot({
    
    
    ggplot(polyps, aes(x=baseline, colour=sex, fill=sex)) +
      geom_histogram(alpha=0.5, position="identity") +
      facet_grid(sex ~ .)
  })
  
    # Render the plot
  output$dat_table <- renderDataTable(polyps)
   
}

# Run the application 
shinyApp(ui = ui, server = server)
