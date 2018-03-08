library(ggplot2)
server <- function(input, output){

  output$pred_table <- DT::renderDataTable({

    genPreds(
      Sepal.Length = input$Sepal.Length,
      Sepal.Width = input$Sepal.Width,
      Petal.Length = input$Petal.Length,
      Petal.Width = input$Petal.Width
    ) %>%
      datatable() %>%
      formatPercentage(columns = "preds", digits = 2)

  })

  output$distPlot <- renderPlot({
    ggplot(data = iris, aes(x = Sepal.Length, y = Sepal.Width))+
      geom_point(aes(color = Species))+
      xlab("Sepal Length") + ylab("Sepal Width") +
      ggtitle("Sepal Length-Width")
  })

  output$plot1 <- renderPlot({
    ggplot(data = iris, aes(x = Sepal.Length, fill = Species))+
      geom_density(stat = "density", alpha = I(0.2))+
      xlab("Sepal Length") + ylab("Density") + ggtitle("Density Curve of Sepal Length")
  })

  output$plot2 <- renderPlot({
    ggplot(data = iris, aes(x = Sepal.Width, fill = Species))+
      geom_density(stat = "density", alpha = I(0.2))+
      xlab("Sepal Width") + ylab("Density") + ggtitle("Density Curve of Sepal Width")
  })

  output$plot3 <- renderPlot({
    ggplot(data = iris, aes(x = Petal.Length, fill = Species))+
      geom_density(stat = "density", alpha = I(0.2))+
      xlab("Petal Length") + ylab("Density") + ggtitle("Density Curve of Petal Length")
  })

  output$plot4 <- renderPlot({
    ggplot(data = iris, aes(x = Petal.Width, fill = Species))+
      geom_density(stat = "density", alpha = I(0.2))+
      xlab("Petal Width") + ylab("Density") + ggtitle("Density Curve of Petal Width")
  })
}
