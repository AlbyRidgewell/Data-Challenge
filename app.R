#
# This is a Shiny web application. You can run the application by clicking
# the 'Run App' button above.
#
# Find out more about building applications with Shiny here:
#
#    http://shiny.rstudio.com/
#

library(shiny)

# Define UI for application that draws a histogram
ui <- fluidPage(

    # Application title
    titlePanel("Old Faithful Geyser Data"),

    # Sidebar with a slider input for number of bins 
    sidebarLayout(
        sidebarPanel(
           uiOutput("select_variable")
        ),

        # Show a plot of the generated distribution
        mainPanel(
           plotOutput("distPlot"),
           plotOutput("plot2")
        )
    )
)

# Define server logic required to draw a histogram
server <- function(input, output) {
  data0 <- read.csv("~/Library/CloudStorage/OneDrive-UniversityofBristol/applied_health_ds/Week_11/group_challenge/Data-Challenge/heart_failure_clinical_records_dataset.csv")
    
  output$distPlot <- renderPlot({
        # generate bins based on input$bins from ui.R
        x    <- data0[, as.character(input$selectedCovariate)]
        bins <- seq(min(x), max(x))

        # draw the histogram with the specified number of bins
        hist(x, breaks = bins, col = 'darkgray', border = 'white',
             xlab = 'Waiting time to next eruption (in mins)',
             main = 'Histogram of waiting times')
    })
        output$select_variable <- renderUI({
          selectInput("selectedCovariate","Please select a covariate",colnames(data0))
       
    })
        
}

# Run the application 
shinyApp(ui = ui, server = server)
