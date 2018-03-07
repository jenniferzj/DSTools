#' @title Power analysis
#' @param r Range of correlations
#' @param p Power values
#' @import pwr

power_analysis <- function(r, p){
  nr <- length(r)
  np <- length(p)
  samsize <- array(numeric(nr*np), dim=c(nr,np))
  for (i in 1:np){
    for (j in 1:nr){
      result <- pwr.r.test(n = NULL, r = r[j],
                           sig.level = .05, power = p[i],
                           alternative = "two.sided")
      samsize[j,i] <- ceiling(result$n)
    }
  }
  xrange <- range(r)
  yrange <- round(range(samsize))
  colors <- rainbow(length(p))
  plot(xrange, yrange, type="n",
       xlab="Correlation Coefficient (r)",
       ylab="Sample Size (n)" )
  for (i in 1:np){
    lines(r, samsize[,i], type="l", lwd=2, col=colors[i])
  }
}
