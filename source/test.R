
source("source/clustring.R")


pipeRun <- function() {
  wordlist <<- vocabulary("deu-eu_web_2015_10K-words.txt", 1000)
  distanceMatrix <<- preprocess(wordlist, StoS.TriGram)
  clusterResult <<- Lloyd(distanceMatrix, recenter.Heuristical, 200)
}

pipeLoad <- function() {
  clusterResult <<- memory.loadCluster("test")
  # distanceMatrix <<- preprocess(clusterResult[["taxonomy"]]$string, StoS.TriGram)
}


pipeDisplay <- function() {
  pipeLoad()
  display.wordcloud(clusterResult[["taxonomy"]], clusterResult[["hierarchy"]], "test")
}


benchmark <- function() {
  system.time(pipeRun())
  system.time(pipeLoad())
  system.time(pipeDisplay())
}


pipeDisplay()
