rm(list = ls(.GlobalEnv), envir = .GlobalEnv)

# Structure
Cluster <- setClass(
  "Cluster",
  
  slots = c(
    strings = "character",
    children   = "list",
    silblings = "list",
    center = "character",
    variance = "double"
  ),
  
  prototype=list(
    strings = c(),
    children = list(),
    silblings = list(),
    center = "",
    variance = 0.0
  ),
  
  validity =function(object) {
    return(TRUE);
  }
)

# # get variance of cluster
# setGeneric(name="getWords",
#            def=function(self)
#            {
#              standardGeneric("getWords")
#            }
# )


# get all words of a cluster
setGeneric(name="getWords",
           def=function(self)
           {
             standardGeneric("getWords")
           }
)

setMethod(f="getWords",
          signature="Cluster",
          definition=function(self)
          {
            wordList <- self@strings
            
            for (x in self@children) {
              wordList = c(wordList, getWords(x) )
            }
            return(wordList)
          }
)

# 

# a <- Cluster(strings = c("a", "b") )
# b <- Cluster(strings = c("c", "d") )
# 
# c <- Cluster(strings = c("e"), children = c(a, b))
# 
# getWords(c)
