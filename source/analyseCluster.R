
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
  
  taxonomy <<- data.frame(string=wordlist, cluster=0)
  taxonomy$string <<- as.character(taxonomy$string)
  taxonomy$cluster <<- as.numeric(taxonomy$cluster)
  
  hierarchy <<- data.frame(cluster=cluster, partOf=partOf, center=center, variance=variance, count=count)
  hierarchy$center <<- as.character(hierarchy$center)
  hierarchy$cluster <<- as.numeric(hierarchy$cluster)
  # hierarchy$partOf <<- as.character(hierarchy$partOf)
  
  apply(
    hierarchy, 
    1, 
    function(row) { 
      taxonomy[ taxonomy$string == row[["center"]],]$cluster <<- as.integer(row[["cluster"]])
      hierarchy[hierarchy$cluster == as.integer(row[["cluster"]]), ]$count <<-  hierarchy[hierarchy$cluster == as.integer(row[["cluster"]]), ]$count + 1
    }
  )
  
  apply(
    taxonomy, 
    1,
    function(row) {
      string <- row[["string"]]
      diffs <- sapply(hierarchy, function(cluster) { 
        variance <- cluster[["variance"]]
        count <- cluster[["count"]]
        # abstand(string, cluster[["center"]]) 
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
