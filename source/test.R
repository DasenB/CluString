
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

test.displayMapDE <- function() {
  clusterResult <- memory.loadCluster("orte_de_2000")
  # display.mapDE(clusterResult[["taxonomy"]], clusterResult[["hierarchy"]], c(9, 12, 17, 19, 23, 25, 28, 47))
  display.mapDE(clusterResult[["taxonomy"]], clusterResult[["hierarchy"]], c(19, 28, 9))
}

test.displayTagPie <- function() {
  clusterResult <- memory.loadCluster("orte_de_2000")
  display.tagpie( clusterResult[["taxonomy"]], clusterResult[["hierarchy"]], clusterResult[["hierarchy"]]$cluster[1:50])
}

test.displayTagPie()

test.displayMapDE()

