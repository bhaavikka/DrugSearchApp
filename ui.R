#
# This is the user-interface definition of a Shiny web application. You can
# run the application by clicking 'Run App' above.
#
# Find out more about building applications with Shiny here:
#
#    http://shiny.rstudio.com/
#

library(shiny)
library(shinythemes)

shinyUI(fluidPage(theme= shinytheme("cyborg"),
  titlePanel("Drug Search App"),
  sidebarLayout(
    sidebarPanel(
      textInput("search", "Search drug name"),
      actionButton("searchBtn", "Search")
    ),
    mainPanel(
      DT::dataTableOutput("results")
    )
  )
))
