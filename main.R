Cluster <- setClass(
  "Cluster",
  
  slots = c(
    strings = "character",
    children   = "list",
    silblings = "list"
  ),
  
  prototype=list(
    strings = c(),
    children = c(),
    silblings = c()
  ),
  
  validity =function(object) {
    return(TRUE);
  }
)