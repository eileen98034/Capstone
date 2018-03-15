# REFERENCE: https://shiny.rstudio.com/articles/build.html

library(shiny)

# Define UI for the miles per gallon TEST app ----
ui <- fluidPage(
  
  # application title
	titlePanel("Miles per Gallon"),	
	
	# sidebar panel for inputs
	sidebarPanel(
	  
	  # Input: Selector for variables to plot against mpg ----
	  selectInput("variable", "Variable:",
	             c("Cylinders" = "cyl",
	               "Transmission" = "am", 
	               "Gears" = "gear")),
	  #Input: Checkbox for whether outliers should be included ----
	  checkboxInput("outliers", "Show outliers", TRUE)
	),
	
	# main panel for displaying output
	mainPanel(
	  
	  # Output: Formatted text for caption ----
	  h3(textOutput("caption")),
	  
	  # Output: Plot of the requested variable against mpg
	  plotOutput("mpgPlot")
	  
	)
)

# Data pre-processing ----
# Tweak the "am" variable to have nicer factor labels -- since this
# doesn't rely on any ouser inputs, we cann do this once at startup
# and then use the value throughtout the lifetime of the app
mpgData <- mtcars
mpgData$am <- factor(mpgData$am, labels = c("Automatic", "Manual"))

# Define server logic to plot variables against mpg ----
server <- function(input, output) {
  
  # Copmute the formula text ----
  # This is in a reactive expression since it is shared by the 
  # output$caption and the output$mpgPlot functions
  formulaText <- reactive({
    paste("mpg ~", input$variable)
  })
  
  # Return the formula text for p rinting as a caption ----
  output$caption <- renderText({
    formulaText()
  })
  
  # Generate a plot of the requested variable against mpg ----
  # an only exclude outliers if requested
  output$mpgPlot <- renderPlot({
    boxplot(as.formula(formulaText()),
            data = mpgData,
            outline = input$outliers,
            col = "#75AADB", pch = 19)
  })
}

shinyApp(ui, server)
