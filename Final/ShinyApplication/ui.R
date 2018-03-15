#
# Coursera Data Science Capstone - Final Project
# E.Manton, March 25, 2018
#

# REFERENCE THEME: http://shiny.fee.tche.br/examples/117-shinythemes/

# load libraries; don't display metadata
suppressPackageStartupMessages(c(
  library(shinythemes),
  library(shiny)
))

# give the application a title and browser tab text
appTitle = (div(HTML("<center>Coursera Johns Hopkins Swiftkey Data Science Capstone</center>")))
browserText = "Capstone"

# create tabs and panels
shinyUI(fluidPage(titlePanel(appTitle,browserText),
                  
  hr(), # styling
  tags$head(tags$style(HTML("
    #final_text {
      text-align: center;
    }
    div.box-header {
      text-align: center;
    }
    "))),

  theme = shinytheme("united"),
  
  navbarPage("Next Word Prediction",id ="navpanel",
             
  # Home tab is panel with a sidebar and main sections  
  tabPanel("Home",
    sidebarLayout(
      
    #sidebar - Instructions 
      sidebarPanel(id="sidebarPanel"
                   , includeHTML("./instructions/instructions.html")
                   ), 

      # mainpanel - text prediction app
      mainPanel(id="mainpanel",
          tags$div(textInput("text", 
            label = h4("Input"),
            value = ),
            br(),
            tags$hr(),
            
            h4("Suggested next word:"),
            tags$span(style="color:red",
            tags$strong(tags$h3(textOutput("nextWords")))),
            br(),
            tags$hr(),
            
            h4("Your input:"),
            tags$span(style="color:red",
            tags$em(tags$h3(textOutput("inputWords")))),
            align="center"))
        ),
    
        # footer
        hr(),
        div(class="footer", includeMarkdown("./footer/footer.md"))
      ),

      # Analysis - the Milestone Report
      tabPanel("Exploratory Analysis", includeHTML("./analysis/analysis.html")),
  
      # References - Text Mining, Natural Language Processing
      tabPanel("Technical References", includeHTML("./references/references.html")),
 
      # Sponsors - Coursera, Johns Hopkins, Swiftkey
      tabPanel("Sponsors",includeMarkdown("./sponsors/sponsors.md")),

      # About - R, Shiny, and me
      tabPanel("About",includeHTML("./about/about.html")),

      tags$hr()
)))

