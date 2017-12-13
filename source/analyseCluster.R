
setwd("source")
source("stringDistance.R")
source("wortschatz.R")

taxonomy <- NULL

hierarchy <- NULL

Lloyd <- function(wordlist, k, abstand){
  
  # Select random a word as center for each cluster
  randomCenters <- sample(wordlist, k, replace = FALSE)
  
  cluster=c(1:k)
  partOf=0
  center=randomCenters
  variance=0
  count=0
  sumOfSquares=0 
  
  taxonomy <<- data.frame(string=wordlist, cluster=0, distanceToCenter=0)
  taxonomy$string <<- as.character(taxonomy$string)
  taxonomy$cluster <<- as.numeric(taxonomy$cluster)
  taxonomy$distanceToCenter <<- as.numeric(taxonomy$distanceToCenter)
  
  hierarchy <<- data.frame(cluster=cluster, partOf=partOf, center=center, variance=variance, sumOfSquares=sumOfSquares, count=count)
  hierarchy$center <<- as.character(hierarchy$center)
  hierarchy$cluster <<- as.numeric(hierarchy$cluster)

  # Pick a random center for each of k clusters
  apply(
    hierarchy, 
    1, 
    function(row) { 
      taxonomy[ taxonomy$string == row[["center"]],]$cluster <<- as.integer(row[["cluster"]])
      hierarchy[hierarchy$cluster == as.integer(row[["cluster"]]), ]$count <<-  hierarchy[hierarchy$cluster == as.integer(row[["cluster"]]), ]$count + 1
    }
  )
  
  # Add each word to the cluster for which the variance is increased the least
  apply(
    taxonomy, 
    1,
    function(row) {
      string <- row[["string"]]
      diffs <- sapply(hierarchy$center, function(center) { 
        distance <- abstand(string, center)
        return(distance)
      })
      taxonomy[taxonomy$string == string, ]$
      
      # print(diffs)
      # closestCluster <- which.min(diffs)
      
      # taxonomy[taxonomy$string == string, ]$cluster <- 
      
      # closest <- min(as.vector(diffs))
      # print(closest)
    }
  )
  
  
  
}


result <- Lloyd(wortschatz(100), 10, dist.sorendice)
