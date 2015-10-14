library(shiny)
library(ggplot2)
library(ggvis)
library(choroplethr)
library(choroplethrZip)

data(df_state_demographics)
data(df_county_demographics)
data(df_zip_demographics)

shinyServer(function(input, output) {

  output$state = renderPlot({
    ggplot(df_state_demographics, aes_string(input$x, input$y)) +
      geom_point() +
      geom_smooth(method="lm")  
  })
  output$county = renderPlot({
    ggplot(df_county_demographics, aes_string(input$x, input$y)) +
      geom_point() +
      geom_smooth(method="lm")  
  })
  output$zip = renderPlot({
    ggplot(df_zip_demographics, aes_string(input$x, input$y)) +
      geom_point() +
      geom_smooth(method="lm")  
  })
  

})

