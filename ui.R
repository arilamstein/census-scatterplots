library(shiny)
library(choroplethr)
library(ggvis)

data(df_state_demographics)
choices = colnames(df_state_demographics)[2:ncol(df_state_demographics)]

shinyUI(fluidPage(

  titlePanel("Interactive Scatterplots of 2013 Census Data"),
  
  div(HTML("By <a href='http://www.arilamstein.com'>Ari Lamstein</a>. Blog Post <a href='http://www.arilamstein.com/blog/2015/10/17/interactive-scatterplots-of-census-data-using-ggvis/'>here</a>.")),
  div(HTML("Want to analyze data like this? Take my free course <a href='http://www.arilamstein.com/free-course'>Learn to Map Census Data in R</a>.")),

  sidebarLayout(
    sidebarPanel(
      selectInput("x",
                  "x",
                  choices  = choices,
                  selected = "percent_white"),
      selectInput("y",
                  "y",
                  choices  = choices,
                  selected = "median_age")
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
