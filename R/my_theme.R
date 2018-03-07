#' @title Create a new ggplot theme function
#' @import ggthemes


my_theme <- function(){
  theme_bw(base_size=12, base_family="Avenir") %+replace%
    theme(
      panel.background  = element_blank(),
      plot.background = element_rect(fill="gray96", colour=NA),
      legend.background = element_rect(fill="transparent", colour=NA),
      legend.key = element_rect(fill="transparent", colour=NA)
    )
}
