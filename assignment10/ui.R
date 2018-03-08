library(shiny)
ui <- fluidPage(
  titlePanel("Predicting Probabilities of Each Species"),
  sidebarLayout(
    sidebarPanel(
      sliderInput("Sepal.Length",label = "Sepal.Length:", value = 5
                  , min = 4.3, max = 7.9, step = .1)
      , numericInput("Sepal.Width", "Sepal.Width:", value = 3
                     , min = 2, max = 4.4, step = .1)
      , numericInput("Petal.Length", "Petal.Length:", value = 3,
                     min = 1, max = 6.9, step = .1)
      ,sliderInput("Petal.Width",label = "Petal.Width:", value = 1
                   , min = 0.1, max = 2.5, step = .1)
    ),
    mainPanel(
      tabsetPanel(type = 'tabs',
                  tabPanel("Prediction Table", tableOutput("pred_table")),
                  tabPanel("Scatter plot", plotOutput("distPlot")),
                  tabPanel("Density plot for Sepal Length", plotOutput("plot1")),
                  tabPanel("Density plot for Sepal Width", plotOutput("plot2")),
                  tabPanel("Density plot for Petal Length", plotOutput("plot3")),
                  tabPanel("Density plot for Petal Width", plotOutput("plot4"))
      )
    )
  )
)
