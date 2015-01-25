library(shiny)
library(markdown)
shinyUI(fluidPage(
        titlePanel("Glomerular filtration rate (GFR)"),
        sidebarLayout(
                sidebarPanel(
                        h4("Calculate GFR based on serum creatinine"),
                        br(),
                        br(),
                        selectInput("sex", 
                                    label = "Choose the sex",
                                    choices = list("Male", "Female"),
                                    selected = "Female"),
                        br(),
                        br(),
                        sliderInput("cr", 
                                    label = "Creatinine (mg/dl):",
                                    min = 0, max = 10, step= .1,  value = .8),
                        br(),
                        br(),
                        sliderInput("age", 
                                    label = "Age in years:",
                                    min = 18, max = 100, step= 1,  value = 20),
                        selectInput("race", 
                                    label = "Choose the race",
                                    choices = list("African-American", "non-African-American"),
                                    selected = "African-American"),
                        br(),
                        br(),
                        submitButton("Submit")
                ),
                
                mainPanel(
                        br(),
                        br(),
                        h5(textOutput("text1")),
                        br(),
                        br(),
                        h4(textOutput("text2")),
                        br(),
                        br(),
                        h4(textOutput("text3")),
                        br(),
                        br(),
                        br(),
                        includeMarkdown("documentation.md")
        )
        )
))