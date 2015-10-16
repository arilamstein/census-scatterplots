library(shiny)
library(ggplot2)
library(ggvis)
library(choroplethr)
library(choroplethrMaps)
library(choroplethrZip)

data(df_state_demographics)
data(df_county_demographics)
data(df_zip_demographics)

state_tooltip = function(x) 
{
  if (!is.null(x) && "region" %in% colnames(x))
  {
    x$region
  }
}

county_tooltip = function(x) 
{
  if (!is.null(x) && "region" %in% colnames(x))
  {
    data(county.regions)
    county.name  = county.regions[county.regions$region == x$region, "county.name"]
    county.state = county.regions[county.regions$region == x$region, "state.name"]
    paste0(county.name, ", ", county.state)
  }
}

zip_tooltip = function(x)
{
  if (!is.null(x) && "region" %in% colnames(x))
  {
    data(zip.regions)
    county.name = zip.regions[zip.regions$region == x$region, "county.name"]
    state.name  = zip.regions[zip.regions$region == x$region, "state.name"]
    paste0(x$region, ", ", county.name, ", ", state.name)
  }
}

shinyServer(function(input, output) {

  output$state = reactive({
    df_state_demographics %>%
      ggvis(x = as.name(input$x), y = as.name(input$y)) %>%
      layer_points(key := ~region) %>%
      add_tooltip(state_tooltip, "hover") %>%
      layer_model_predictions(model="lm", stroke:="blue") %>%
      bind_shiny("state")
  })

  output$county = reactive({
    df_county_demographics %>%
      ggvis(x = as.name(input$x), y = as.name(input$y)) %>%
      layer_points(key := ~region, opacity := 0.25) %>%
      add_tooltip(county_tooltip, "hover") %>%
      layer_model_predictions(model='lm', stroke:="blue") %>%
      bind_shiny("county")
  })

  output$zip = reactive({
    df_zip_demographics %>%
      ggvis(x = as.name(input$x), y = as.name(input$y)) %>%
      layer_points(key := ~region, opacity := 0.1) %>%
      add_tooltip(zip_tooltip, "hover") %>%
      layer_model_predictions(model='lm', stroke:="blue") %>%
      bind_shiny("zip")
  })

})

