rm(list = ls(.GlobalEnv), envir = .GlobalEnv)

Cluster <- setClass(
  "Cluster",
  
  slots = c(
    strings = "character",
    children   = "list",
    silblings = "list"
  ),
  
  prototype=list(
    strings = c(),
    children = list(),
    silblings = list()
  ),
  
  validity =function(object) {
    return(TRUE);
  }
)

setGeneric(name="getWords",
           def=function(self,position)
           {
             standardGeneric("getWords")
           }
)

setMethod(f="getWords",
          signature="Cluster",
          definition=function(self,position)
          {
            wordList <- self@strings
            
            for (x in self@children) {
              wordList = c(wordList, getWords(x) )
            }
            return(wordList)
          }
)

a <- Cluster(strings = c("a", "b") )
b <- Cluster(strings = c("c", "d") )

c <- Cluster(strings = c("e"), children = c(a, b))

getWords(c)

