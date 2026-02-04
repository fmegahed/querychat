# ISA 401 OEWS Jobs Explorer
# A Shiny app for exploring U.S. Occupational Employment and Wage Statistics

library(shiny)
library(bslib)
library(querychat)
library(DT)
library(dplyr)
library(RSQLite)

# Load preprocessed data
oews <- readRDS("data/oews.rds")

# Step 1: Create QueryChat object
client = ellmer::chat_openai(
  model = "gpt-5-mini-2025-08-07",
  credentials = function(){return(Sys.getenv("OPENAI_API_KEY"))}
)

qc = querychat::querychat(
  oews,
  client = client,
  greeting = "Welcome to Our ISA 401 Assistant for Understanding the OEWS Dataset",
  extra_instructions = "data/extra_instructions.md",
  data_description = 'data/data_desc.md'
)

## Based on the documentation:
# https://posit-dev.github.io/querychat/r/articles/build.html#programmatic-filtering

# Step 2: Add UI component
ui <- bslib::page_sidebar(
  sidebar = qc$sidebar(),
  bslib::card(
    bslib::card_header("Data Table"),
    DT::DTOutput("table")
  ),
  bslib::card(
    fill = FALSE,
    bslib::card_header("SQL Query"),
    shiny::verbatimTextOutput("sql")
  )
)

# Step 3: Use reactive values in server
server <- function(input, output, session) {
  qc_vals <- qc$server()
  
  output$table <- DT::renderDT({
    DT::datatable(qc_vals$df(), fillContainer = TRUE)
  })
  
  output$sql <- shiny::renderText({
    qc_vals$sql() %||% "SELECT * FROM oews"
  })
}

shiny::shinyApp(ui, server)
