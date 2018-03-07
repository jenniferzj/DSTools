#' @title Bootstrap samples
#' @param data
#' @param b The random indexes for the bootstrap sample
#' @param formula
#' @import boot

bootstrap <- function(data,b,formula){
  d <- data[b,]
  betfun <- lm(d[,1]~d[,2], data = d)$coef[2]
  bootbet <- boot(data="your data here", statistic=betfun, R=5000)
  names(bootbet)
  plot(bootbet)
  hist(bootbet$t, breaks = 100)
}
