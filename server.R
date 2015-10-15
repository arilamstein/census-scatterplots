library(shiny)
library(ggplot2)
library(ggvis)
library(choroplethr)
library(choroplethrZip)

data(df_state_demographics)
data(df_county_demographics)
data(df_zip_demographics)

shinyServer(function(input, output) {

  output$state = reactive({
    df_state_demographics %>%
      ggvis(prop("x", as.name(input$x)), prop("y", as.name(input$y))) %>%
      layer_points() %>%
      bind_shiny("state")
  })

  output$county = reactive({
    df_county_demographics %>%
      ggvis(prop("x", as.name(input$x)), prop("y", as.name(input$y)), opacity := 0.25) %>%
      layer_points() %>%
      layer_model_predictions(model='lm', se=TRUE) %>%
      bind_shiny("county")
  })
  
  output$zip = renderPlot({
    df_zip_demographics %>%
      ggvis(prop("x", as.name(input$x)), prop("y", as.name(input$y)), opacity := 0.1) %>%
      layer_points() %>%
      layer_model_predictions(model='lm', se=TRUE) %>%
      bind_shiny("zip")
  })
  
})

