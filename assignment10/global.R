library(DT)

IrisClass <- xgb.load("iris.model")
load("IrisClassInfo.rda")

genPreds <- function(Sepal.Length = 5, Sepal.Width = 3, Petal.Length = 1, Petal.Width = 4){

  testDF <- data.frame(Sepal.Length = Sepal.Length, Sepal.Width = Sepal.Width, Petal.Length = Petal.Length, Petal.Width = Petal.Width)

  preds <- predict(IrisClass, as.matrix(testDF))


  data.frame(
    Species = IrisClassInfo$var.levels
    ,preds
  ) %>%
    arrange(desc(preds))
}
