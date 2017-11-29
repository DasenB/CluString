rm(list = ls(.GlobalEnv), envir = .GlobalEnv)

setwd("source")
source("Cluster.R")
source("stringDistance.R")
source("wortschatz.R")


Lloyd <- function(words, k, abstand){
  
  # Choose k random centerwords
  centers = sample(words, k, rep=F)
  setdiff(words, centers)
  
  clusters <- c()
  
  for (word in centers) {
    newCluster <- Cluster()
    clusters <- c(clusters, newCluster)
  }
  View(clusters)
  
  
  
  # kmeans(selectedData(), 2)
}

