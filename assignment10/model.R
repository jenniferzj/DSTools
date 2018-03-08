library(xgboost)
library(tidyverse)

Iris <- iris

y1 <- Iris$Species

var.levels <- levels(y1)

y = as.integer(y1) - 1

noOutcome <- Iris[,-5]
x = noOutcome[,c('Sepal.Length','Sepal.Width', 'Petal.Length', 'Petal.Width')]
var.names <- names(x)
x = as.matrix(x)

params <- list(
  "objective" = "multi:softprob"
  ,"eval_metric" = "mlogloss"
  ,"num_class" = length(table(y))
  ,"eta" = 0.25
  ,"max_depth" = 3
)

cv.nround = 125

bst.cv <- xgb.cv(param = params, data = x, label = y
                 , nfold = 5, nrounds = cv.nround
                 , missing = NA
                 , prediction = TRUE)

which.min(bst.cv$evaluation_log$test_mlogloss_mean)

IrisClass <- xgboost(param = params, data = x, label  = y,
                     nrounds = cv.nround, missing  = NA)


xgb.importance(var.names, model = IrisClass)

xgb.save(IrisClass, "iris.model")

IrisClassInfo <- list(
  var.names = var.names
  ,var.levels = var.levels
)

save(IrisClassInfo, file = 'IrisClassInfo.rda')

# Gen Predictions #

genPreds <- function(Sepal.Length = 5, Sepal.Width = 3, Petal.Length = 1, Petal.Width = 4){

  testDF <- data.frame(Sepal.Length = Sepal.Length, Sepal.Width = Sepal.Width, Petal.Length = Petal.Length, Petal.Width = Petal.Width)

  preds <- predict(IrisClass, as.matrix(testDF))


  data.frame(
    Species = var.levels
    ,preds
  ) %>%
    arrange(desc(preds))
}
