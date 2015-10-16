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
                  selected = "percent_white"),
      selectInput("y",
                  "y",
                  choices = colnames(df_state_demographics),
                  selected = "median_age"),
    ),

    mainPanel(
      ggvisOutput("state"),
      ggvisOutput("county"),
      plotOutput("zip")
    )
  )
))
