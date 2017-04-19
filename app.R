body <- dashboardBody(
  fluidRow(
    box(
      title = "Box title",
      status = "primary",
      plotOutput("plot1")
    ),
    box(
      status = "warning",
      plotOutput("plot2")
    )
  ),
  fluidRow(
    column(
      width = 4,
      box(
        title = "Title 1",
        solidHeader = TRUE,
        status = "primary",
        width = NULL,
        sliderInput("slider", "Orders", min = 1, max = 100, value = 30),
        radioButtons("radio", "Fill", choices = c("None", "Blue", "Black", "Red"))
      ),
      box(
        background = "black",
        width = NULL,
        br(), "A box with a solid black background"
      )
    ),
    column(
      width = 4,
      box(
        title = "Title 2",
        width = NULL,
        "Box content here"
      ),
      box(
        title = "Title 5",
        background = "light-blue",
        width = NULL,
        "A box with a solid light-blue background"
      )
    ),
    column(
      width = 4,
      box(
        title = "Title 3",
        solidHeader = TRUE,
        status = "warning",
        width = NULL,
        selectInput("select", "Spread", choices = c("100%", "90%", "80%", "70%", "60%"))
      ),
      box(
        title = "Title 6",
        background = "maroon",
        width = NULL,
        "A box with a solid maroon background"
      )
    )
  )
)

ui <- dashboardPage(
  dashboardHeader(title = "Mixed Layout"),
  dashboardSidebar(),
  body
)

server <- function(input, output) {
  output$plot1 <- renderPlot({
    hist(runif(20))
  })

  output$plot2 <- renderPlot({
    plot(sample(10), sample(10))
  })
}

shinyApp(ui, server)
