library(shiny)
library(choroplethr)

data(df_state_demographics)

shinyUI(fluidPage(

  titlePanel("2013 Census Scatterplots"),

  sidebarLayout(
    sidebarPanel(
      selectInput("x",
                  "x",
                  choices = colnames(df_state_demographics),
                  selected = "percent_black"),
      selectInput("y",
                  "y",
                  choices = colnames(df_state_demographics),
                  selected = "per_capita_income"),
      checkboxInput("line", 
                    "line", 
                    value = TRUE)
    ),

    mainPanel(
      plotOutput("state"),
      plotOutput("county"),
      plotOutput("zip")
    )
  )
))