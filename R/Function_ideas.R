#' @title Generate sampling distribution(Function Ideas)
#' @param samples Specity how many samples to run
#' @param sample_size the number of obs in each sample
#' @param mean population mean
#' @param sd population sd


Function_ideas <- function(samples, sample_size, mean, sd){
  sample_Means <-rep(NA, samples)
  for(i in 1:samples){
    x <- rnorm(sample_size, mean, sd)
    sampleMeans[i] = mean(x)
  }
  return(sampleMeans)
}
