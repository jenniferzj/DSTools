#' @title Create a function that provides the top n number of a grouped
#' variable by counts
#' @param data_name Name of data that need to be group
#' @param groupings Groups
#' @import dplyr

count_a_group <- function(data_name, groupings){
  group_by_at(data_name, vars(one_of(groupings)))%>%
    summarise(count = n())
}
