#
# This is the server logic of a Shiny web application. You can run the
# application by clicking 'Run App' above.
#
# Find out more about building applications with Shiny here:
#
#    http://shiny.rstudio.com/
#

library(shiny)
library(DBI)
library(RMySQL)
library(pool)

# Connect to the MySQL database
pool <- dbPool(
  drv = RMySQL::MySQL(),
  dbname = "drug_bank",
  host = "localhost",
  username = "root",
  password = "root",
  port = 3306
)

# Define server logic
shinyServer(function(input, output) {
  output$results <- DT::renderDT({
    # React to input changes and query the database
    if (input$search != "") {
      query <- sprintf("SELECT * FROM drugs WHERE Name LIKE '%%%s%%'", input$search, input$search)
      dbGetQuery(pool, query)
    }
  })
})

