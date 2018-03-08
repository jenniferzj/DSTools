#' @title get the message according to the temperature
#' @param temp temperature that need to be detected
get_the_message <- function(temp){
  if (temp <= 0) {
    message("freezing")
  } else if (temp <= 10) {
    message("cold")
  } else if (temp <= 20) {
    message("cool")
  } else if (temp <= 30) {
    message("warm")
  } else {
    message("hot")
  }
}
