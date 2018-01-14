
library(shiny)


shinyUI(fluidPage(
  
  # Application title
  titlePanel("The Poisson Distribution"),
  
  # Sidebar with a slider input for number of bins 
  sidebarLayout(
    sidebarPanel(
      
      
       numericInput("Given Occurances",
                   "Enter lambda; the ave number of occurances per unit interval",
                   min = 0,
                   max = 100,
                   value = 8,
                   step = 1.0),
       numericInput("Interested Occurance",
                    "Enter occurances of Interest:",
                    min = 0,
                    max = 100,
                    value = 11,
                    step = 1.0),
      numericInput("Interested Interval",
                   "Enter interval to Investigate as proportion of the given unit interval:",
                   min = 0,
                   max = 100,
                   value = 1,
                   step = 0.01),
      
      sliderInput("Sample Size",
                  "Select number of events to plot",
                  min = 0,
                  max = 100,
                  value = 40,step = 5),
      submitButton("Submit")
       
       
    ),
    
  
    mainPanel(
      tabsetPanel(
        tabPanel("App Documentation",
                 
                 h3("1. Enter lamdda (the average number of occurances per given interval)"),

  h3("2. Enter the number of occurances the probability of which you would like to compute"),
  
  h3("3. Enter proprtion of interval you would like to investigate. For example if your lambda is x occurances per day and you want to investigate half a day, then enter 0.5. If you want to investigate 2 days, then enter 2. Note that this will adjust your lambda accordingly."),
  
  h3("4. Submit...Probabilities are displayed on the caculator tab and the visualisation is dispalyed on the plot tab."),
  
  h3("5. You can adjust your visualisation by adjusting the number of points to plot to suit your investigation, and press submit.")


),
        tabPanel("Probability Calculator",
                 
                 
                 h3("NUMBER OF EVENTS (x):"),
                 textOutput("z"),
                 
                 h3("INTERVAL (t):"),
                 textOutput("t"),
                 
                 h4("Probabilty of exactly x events in t interval(s):"),
                 textOutput("Exact"),
                 
                 h4("Probabilty of x events or more in t interval(s):"),
                 textOutput("Upper"),
                 
                 h4("Probabilty of x events or less in t interval(s):"),
                 textOutput("Lower")
                 
        ),
        
       tabPanel("Plot",plotOutput("plot"))
     
       
    )
  )
)))
