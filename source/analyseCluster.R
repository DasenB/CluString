rm(list = ls(.GlobalEnv), envir = .GlobalEnv)

setwd("source")
source("stringDistance.R")
source("wortschatz.R")

taxonomy <- NULL

hierarchy <- NULL

Lloyd <- function(wordlist, k, abstand){
  
  # Select random a word as center for each cluster
  randomCenters <- sample(wordlist, k, replace = FALSE)
  
  cluster=c(1:k)
  center=randomCenters

  taxonomy <<- data.frame(string=wordlist, cluster=0, distanceToCenter=0)
  taxonomy$string <<- as.character(taxonomy$string)
  taxonomy$cluster <<- as.numeric(taxonomy$cluster)
  taxonomy$distanceToCenter <<- as.numeric(taxonomy$distanceToCenter)
  
  hierarchy <<- data.frame(cluster=cluster, partOf=0, center=center, variance=0, sumOfSquares=0, count=0)
  hierarchy$center <<- as.character(hierarchy$center)
  hierarchy$cluster <<- as.numeric(hierarchy$cluster)
  hierarchy$variance <<- as.numeric(hierarchy$variance)
  hierarchy$sumOfSquares <<- as.numeric(hierarchy$sumOfSquares)
  hierarchy$count <<- as.numeric(hierarchy$count)
  
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
      edges <- apply(hierarchy, 1, function(cluster) { 
        distance <- abstand(string, cluster[["center"]])
        sumOfSquares <- distance^2
        variance <- sqrt((as.numeric(cluster[["sumOfSquares"]]) + sumOfSquares)/(as.numeric(cluster[["count"]]) + 1))
        error <- variance - as.numeric(cluster[["variance"]])
        clust <- cluster[["cluster"]]
        list(distance=distance, sumOfSquares=sumOfSquares, variance=variance, error=error, cluster=clust)
      })
      
      errors <- lapply(edges, function(item) { item$error })
      closestCluster <- which.min(errors)
      # print(edges[[closestCluster]]$cluster)
      # closestCluster <- which.min(diffs)
      distance <- edges[[closestCluster]]$distance
      # 
      taxonomy[taxonomy$string == string, ]$cluster <<- closestCluster
      taxonomy[taxonomy$string == string, ]$distanceToCenter <<- distance
      hierarchy[hierarchy$cluster == closestCluster, ]$count <<-  hierarchy[hierarchy$cluster == closestCluster, ]$count + 1
      hierarchy[hierarchy$cluster == closestCluster, ]$sumOfSquares <<- hierarchy[hierarchy$cluster == closestCluster, ]$sumOfSquares + (distance^2)

      
      # print(diffs)
      # closestCluster <- which.min(diffs)
      
      # taxonomy[taxonomy$string == string, ]$cluster <- 
      
      # closest <- min(as.vector(diffs))
      # print(closest)
    }
  )
  
  
  
}


result <- Lloyd(wortschatz(1000), 10, dist.ngramme)
