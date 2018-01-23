
source("source/clustring.R")


test.pipeRun <- function() {
  wordlist <<- vocabulary("deu-eu_web_2015_10K-words.txt", 1000)
  distanceMatrix <<- preprocess(wordlist, StoS.TriGram)
  clusterResult <<- Lloyd(distanceMatrix, recenter.Heuristical, 200)
}

test.pipeLoad <- function() {
  clusterResult <<- memory.loadCluster("test")
  # distanceMatrix <<- preprocess(clusterResult[["taxonomy"]]$string, StoS.TriGram)
}


test.pipeDisplay <- function() {
  pipeLoad()
  display.wordcloud(clusterResult[["taxonomy"]], clusterResult[["hierarchy"]], "test")
}


test.benchmark <- function() {
  system.time(pipeRun())
  system.time(pipeLoad())
  system.time(pipeDisplay())
}

test.pipeMapRun <- function() {
  worldmap <<- read.csv("data/location/worldmap.csv")
  wordlist <<- worldmap$city
  wordlist <<- sample(wordlist, 2000, replace = FALSE)
  distanceMatrix <<- preprocess(wordlist, StoS.TriGram)
  clusterResult <<- Cluster.Lloyd(distanceMatrix, recenter.Heuristical, 200)
}


# pipeMapRun()
