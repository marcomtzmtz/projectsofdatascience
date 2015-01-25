library(shiny)
  
shinyServer(function(input, output) {
        output$text1 <- renderText({
                paste("The GFR is calculated for a", input$sex, "of", input$age, "years", input$race, "race with a creatinine of", input$cr, "mg/dl")
        })
        x <- reactive({as.numeric(if(input$sex=="Female" & input$race=="African-American" & input$cr < 0.8){
                print(round((166*(input$cr/0.7)^(-.329))*0.993^input$age,1))
        }
        else if(input$sex=="Female" & input$race=="African-American" & input$cr > 0.7){
                print(round((166*(input$cr/0.7)^(-1.209))*0.993^input$age,1))
        }
        else if(input$sex=="Male" & input$race=="African-American" & input$cr <1 ){
                print(round((163*(input$cr/0.9)^(-.411))*0.993^input$age,1))
        }
        else if(input$sex=="Male" & input$race=="African-American" & input$cr >.9 ){
                print(round((163*(input$cr/0.9)^(-1.209))*0.993^input$age,1))
        }
        else if(input$sex=="Female" & input$race=="non-African-American" & input$cr < 0.8){
                print(round((144*(input$cr/0.7)^(-.329))*0.993^input$age,1))
        }
        else if(input$sex=="Female" & input$race=="non-African-American" & input$cr > 0.7){
                print(round((144*(input$cr/0.7)^(-1.209))*0.993^input$age,1))
        }
        else if(input$sex=="Male" & input$race=="non-African-American" & input$cr <1 ){
                print(round((144*(input$cr/0.9)^(-.411))*0.993^input$age,1))
        }
        else if(input$sex=="Male" & input$race=="non-African-American" & input$cr >.9 ){
                print(round((144*(input$cr/0.9)^(-1.209))*0.993^input$age,1))
        }
        )
        }
        )
        output$text2 <- renderText({x() })
        output$text3 <- renderText({if({x() }>90){ print("The GFR is normal")}
                                    else{print("The GFR is abnormal, consultation with a Nephrologist is important, acute or chronic renal failure must be evaluated")}
                                            })
        })