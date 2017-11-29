
# Structure
Cluster <- setClass(
  "Cluster",
  
  slots = c(
    strings = "character",
    children   = "list",
    silblings = "list",
    center = "character",
    variance = "numeric"
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
           def=function(cluster)
           {
             standardGeneric("getWords")
           }
)

setMethod(f="getWords",
          signature="Cluster",
          definition=function(cluster)
          {
            wordList <- cluster@strings
            for (x in cluster@children) {
              wordList = c(wordList, getWords(x) )
            }
            return(wordList)
          }
)

# add a word to a cluster
setGeneric(name="addWord",
           def=function(cluster, word)
           {
             standardGeneric("addWord")
           }
)

setMethod(f="addWord",
          signature="Cluster",
          definition=function(cluster, word)
          {
            cluster@strings = c(cluster@strings, word)
            return(cluster)
          }
)

# add a subcluster to a cluster
setGeneric(name="addSubcluster",
           def=function(cluster, subcluster)
           {
             standardGeneric("addSubcluster")
           }
)

setMethod(f="addSubcluster",
          signature="Cluster",
          definition=function(cluster, subcluster)
          {
            cluster@children = c(cluster@children, subcluster)
            return(cluster)
          }
)

# find the center
setGeneric(name="findCenter",
           def=function(cluster)
           {
             standardGeneric("findCenter")
           }
)

setMethod(f="findCenter",
          signature="Cluster",
          definition=function(cluster)
          {
            words <- getWords(cluster)
            
            return(cluster)
          }
)


# a <- Cluster(strings = c("a", "b") )
# b <- Cluster(strings = c("c", "d") )
# 
# c <- Cluster(strings = c("e"), children = c(a, b))
# 
# getWords(c)
