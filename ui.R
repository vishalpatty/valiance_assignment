setwd("F://Working Directory//Valiance")
library(shiny)
shinyUI(fluidPage(
        titlePanel(title="Insights on Pharmacists at PHCs & CHCs in Tribal area as of 
                   31st March 2017"),
        sidebarLayout(
          sidebarPanel(
            selectInput("visualisation1", h3("Select the desired type of Visualisation"),
                        c("None"=0, "Requirement of Pharmacist"=1, "No. of Sanctioned Pharmacist
                          Position"=2, "No. of Working Pharmacist"=3, 
                          "Pharmacist Vacancy"=4, "Shortfall of Pharmacist"=5,
                          "Vacancy in Total Sanctioned Positions"=6, 
                          "Shortfall in total no. of Required Pharmacists"=7)
                        ),
            radioButtons("color", "Select the Visualisation Colour:", 
                         choices = c("Red", "Green", "Yellow", "Blue", "Black", "Cyan", "White"))),
            mainPanel(
              tabsetPanel(type = "tab",
                          tabPanel("Summary", verbatimTextOutput("smr")),
                          tabPanel("Structure", verbatimTextOutput("str")),
                          tabPanel("Data", verbatimTextOutput("data")),
                          tabPanel("Visualisation", plotOutput("req")))
          )
          )
        )
        )