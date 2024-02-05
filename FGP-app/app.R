#
# This is a Shiny web application. You can run the application by clicking
# the 'Run App' button above.
#
# Find out more about building applications with Shiny here:
#
#    https://shiny.posit.co/
#

library(shiny)
# runExample("01_hello")      # a histogram
# runExample("02_text")       # tables and data frames
# runExample("03_reactivity") # a reactive expression
# runExample("04_mpg")        # global variables
# runExample("05_sliders")    # slider bars
# runExample("06_tabsets")    # tabbed panels
# runExample("07_widgets")    # help text and submit buttons
# runExample("08_html")       # Shiny app built from HTML
# runExample("09_upload")     # file upload wizard
# runExample("10_download")   # file download wizard
# runExample("11_timer")      # an automated timer

# Define UI for application that draws a histogram
ui <- fluidPage(

    # Application title
    titlePanel("Functional Genomics Pipeline Processing"),

    fluidRow(wellPanel("Top row")),

    sidebarLayout(
        # Sidebar Layout Elements (i.e. the panels)
        sidebarPanel = sidebarPanel(
            helpText("Helop text!"),

            #Control Widget
            selectInput(
                inputId = "input_1",
                label = "Short description of control widget",
                choices = c(
                    "Iowa" = "IA",
                    "Colorado" = "CO",
                    "Massachusetts" = "MA")),

            fileInput("file", h3("File input"))
        ),

    mainPanel = mainPanel(
        h1("First level title"),
        textOutput("selected_var")
        )
    )
)

    # Grid layout, max 12-wide
    #
    # fluidRow(column(width = 4, wellPanel("Bottom row, column 1, width 4")),
    #          column(width = 8, wellPanel("Bottom row, column 2, width 8")))


# Define server logic required to draw a histogram
server <- function(input, output) {

    output$selected_var <- renderText({
        paste("You have selected this", input$input_1)
    })

}

# Run the application
shinyApp(ui = ui, server = server)
