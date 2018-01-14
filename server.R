
library(shiny)

shinyServer(function(input, output) {
   
  
    
    output$plot <- renderPlot({
      
      n <- input$`Sample Size`
      lambda <- input$`Given Occurances`
      z <- input$`Interested Occurance`
      t<- input$`Interested Interval`
      lambda2 <- lambda * input$`Interested Interval`
      p <- dpois(x= z,lambda = lambda*t)
      p2 <- round((p * 100),3)
      
      
      library(ggfortify)
      ggdistribution(dpois, seq(0,n,1), lambda = lambda2, fill = "blue" ) +
        geom_hline(yintercept = p) +
        annotate("text",0.1, p, vjust = -0.5, label = paste(p2,"%")) +
          geom_vline(xintercept = z) +
            annotate("text",z, 0.005, hjust = 0.005, label = z) +
            annotate("text",z, 0.005, hjust = 0.005, label = z) +
              ggtitle(paste("lambda =",lambda2)) +
                  xlab("x: no of events") +
                      ylab("probability") 
              
        
     
      
    })
    
        # generate some probabilities
    
    probExact <- reactive({
      
      lambda <- input$`Given Occurances`
      z <- input$`Interested Occurance`
      t<- input$`Interested Interval`
      
      dpois(x= z,lambda = lambda*t)
      
    })
    
    probUpper <- reactive({
      
      lambda <- input$`Given Occurances`
      z <- input$`Interested Occurance`
      t<- input$`Interested Interval`
      
      ppois(q= z,lambda = lambda*t,lower.tail = FALSE)
      
    })
    probLower <- reactive({
      
      lambda <- input$`Given Occurances`
      z <- input$`Interested Occurance`
      t<- input$`Interested Interval`
      
      ppois(q= z,lambda = lambda*t,lower.tail = TRUE)
      
    })
    
    #create outputs
    
    output$Exact <- renderText({
      
      probExact()
      
    })
    
    output$Upper <- renderText({
      
      probUpper()
      
    })
    
    output$Lower <- renderText({
      
      probLower()
      
    })
    
    output$z <- renderText(input$`Interested Occurance`)
    output$t <- renderText(input$`Interested Interval`)
  })
  

