library(shiny)
library(choroplethr)
library(ggvis)

data(df_state_demographics)

shinyUI(fluidPage(

  titlePanel("2013 Census Scatterplots"),

  sidebarLayout(
    sidebarPanel(
      selectInput("x",
                  "x",
                  choices = colnames(df_state_demographics),
                  selected = "median_age"),
      selectInput("y",
                  "y",
                  choices = colnames(df_state_demographics),
                  selected = "per_capita_income")
    ),

    mainPanel(
      div(HTML("<h2><center>States</center></h2>")),
      ggvisOutput("state"),
      div(HTML("<h2><center>Counties</center></h2>")),
      ggvisOutput("county"),
      div(HTML("<h2><center>ZIP Codes</center></h2>")),
      ggvisOutput("zip")
    )
  )
))
